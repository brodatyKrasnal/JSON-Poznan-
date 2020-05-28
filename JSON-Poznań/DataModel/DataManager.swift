//
//JSON-Poznań : DataManager.swift By: Tymon Golęba Frygies on 10:11. 
// Copyright (c) 2020, Tymon Golęba Frygies. All rights reserved.


import Foundation



class DataManager {

    let address = "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe&fbclid=IwAR31UN2RsnFZproxweou795aomhsKZD3nTb7UGeDlwkOE-kK-G6M44th2XE"


    func fetchData() {
        // 1. Create URL 2. Assign URL session 3. Add a task 4. Run the task
        if let url = URL(string: address) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error fetching data: \(String(describing: error))")
                    return
                }

                if let safeData = data {
                    let printableData = String(data: safeData, encoding: .utf8)
                   print(printableData!)
                    self.parseJSON(safeData)
                }

            }
            task.resume()
        }
    }

    func parseJSON (_ dataObject: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TopLevel.self, from: dataObject)
            let id = decodedData.features[0].id
            // and so forth
        } catch {
            print("Error decoding data: \(error)")
        }
    }

}


