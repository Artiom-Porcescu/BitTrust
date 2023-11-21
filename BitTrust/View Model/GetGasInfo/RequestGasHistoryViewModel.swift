//
//  RequestGasHistoryViewModel.swift
//  BitTrust
//
//  Created by Artiom Porcescu on 21.11.2023.
//

import Foundation

final class RequestGasHistoryViewModel: ObservableObject {
    @Published var gasHistory: [GasTimestampItem] = []
    
    private var timer: Timer?
    private let minutesToFetch = 10
    
    init() {
        fetchGasHistory()
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(60 * minutesToFetch), repeats: true) { [weak self] _ in
            self?.fetchGasHistory()
        }
    }
    
    func fetchGasHistory() {
        
        gasHistory = []
        
        let urlString = "https://api.owlracle.info/v4/eth/history?apikey=c6088ad5a83a406f90b4e44b8a19e414&timeframe=10"
        guard let url = URL(string: urlString) else {
            print("Error while setting URL string")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("Error while getting data for URL session")
                return
            }
            
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let res = json["candles"] as? [[String: Any]] else { return }
            print("Gas history json object: \(json)\n\n\n\n")
            for time in res {
                if self.gasHistory.count >= 40 {
                    break
                }
                
                if let timeUnwrapped = time["timestamp"] as? String, let gasPriceDict = time["gasPrice"] as? [String: Any]  {
                    guard let gasPrice = gasPriceDict["close"] as? Double else { return }
                    
                    var preFormattedDateString = ""
                    for n in timeUnwrapped {
                        if n == "T" {
                            preFormattedDateString += " "
                        } else if n == "." {
                            break
                        } else {
                            preFormattedDateString += String(n)
                        }
                    }
                    
                    print("PreFormatted string: \(preFormattedDateString)")
                    print("Gas Price: \(gasPrice)")
                    print("Timestamp Object: \(timeUnwrapped)\n\n\n\n")
                    

                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    
                    if let date = dateFormatter.date(from: preFormattedDateString) {
                        if let newDate = Calendar.current.date(byAdding: .hour, value: 2, to: date) {
                            dateFormatter.dateFormat = "MM-dd HH:mm" 
                            let newDateString = dateFormatter.string(from: newDate)
                            DispatchQueue.main.async {
                                self.gasHistory.append(GasTimestampItem(timestamp: newDateString, gasPrice: Int(gasPrice) ))
                            }
                        }
                    } else {
                        print("Error: Invalid date format")
                    }
                }
            }
            
        }.resume()
    }
    
    deinit {
        timer?.invalidate()
    }
}
