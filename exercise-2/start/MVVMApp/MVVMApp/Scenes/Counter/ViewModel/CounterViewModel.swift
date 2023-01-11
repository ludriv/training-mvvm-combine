import Foundation

protocol CounterViewModelInput {
    func onPlusButtonTap()
    func onMinusButtonTap()
    func onRandomButtonTap()
}

protocol CounterViewModelOutput {
    var countText: Observable<String> { get }
}

typealias CounterViewModelProtocol = CounterViewModelInput & CounterViewModelOutput

class CounterViewModel: CounterViewModelProtocol {
    
    let countText: Observable<String> = .init("")
    
    private let counter: Observable<Int> = .init(0)
    private let numberService: NumberServiceProtocol
    
    init(numberService: NumberServiceProtocol = NumberService()) {
        self.numberService = numberService
        
        counter.bind = { [weak self] count in
            self?.countText.value = "\(count)"
        }
    }
    
    func onPlusButtonTap() {
        counter.value = counter.value! + 1
    }
    
    func onMinusButtonTap() {
        counter.value = counter.value! - 1
    }
    
    func onRandomButtonTap() {
        numberService.getRandomNumber { [weak self] result in
            switch result {
            case .success(let randomNumber):
                self?.counter.value = randomNumber
            case .failure:
                break
            }
        }
    }
}

