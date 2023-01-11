import Foundation

final class NumberServiceMock: NumberServiceProtocol {
    
    var randomNumber: Int?
    var error: Error?
    
    func getRandomNumber(_ completion: @escaping ((Result<Int, Error>) -> Void)) {
        if let randomNumber = randomNumber {
            completion(.success(randomNumber))
        } else if let error = error {
            completion(.failure(error))
        }
    }
}
