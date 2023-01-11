import Foundation

final class NumberService: NumberServiceProtocol {
    
    var semaphore = DispatchSemaphore(value: 0)
    
    func getRandomNumber(_ completion: @escaping ((Result<Int, Error>) -> Void)) {
        let url = URL(string: "http://numbersapi.com/random?min=10&max=120&json")!
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let data = data else {
                completion(.failure(error!))
                self?.semaphore.signal()
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
            
            let decoder = JSONDecoder()
            do {
                let numberResponse = try decoder.decode(NumberResponse.self, from: data)
                completion(.success(numberResponse.number))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
            
            self?.semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
