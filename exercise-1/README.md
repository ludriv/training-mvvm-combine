#  Exercice 1 - Configuration MVVM

1. Créer une `scene` "Counter" avec View et ViewModel.
2. Créer un `protocol` "input" contenant une fonction pour chacune des actions utilisateur possibles.
3. Créer un `protocol` "output" permettant d'exposer le résultat des actions utilisateur.
    Note: Utiliser la classe `Observable` ci-dessous.
4. Déplacer la logique "-/+" dans le ViewModel 
5. Modifier le ViewController pour utiliser le ViewModel.
6. Bonus: Désactiver le bouton "-" (minus) si la valeur "counter" est égal à 0.
7. Bonus: Afficher un "loader" lors de l'appel réseau du service.

```
class Observable<T> {
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
}
```
