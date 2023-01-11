import Foundation

protocol NumberServiceProtocol {
    func getRandomNumber(_ completion: @escaping ((Result<Int, Error>) -> Void))
}
