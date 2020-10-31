
enum LibraryError: Error{
    case bookNotAvailable
    case insufficientPoints(coinsNeeded:Int)
    case outOfStock
    case invalidInput
}

struct Item{
    var points: Int
    var count: Int
    
}

class Library{
    var books=[
       "Ikigai":Item(points:50, count:2),
       "The power of our Subconsious Mind":Item(points:60, count:1),
       "Atomic Habits":Item(points:40, count:3)
    ]
    var coinsDeposited=0
    func lib(itemNamed name: String) throws { // declaring error using throws keyword
        guard let item=books[name] else{
            throw LibraryError.bookNotAvailable // throwing error using throw keyword
        }
        guard item.count>0 else{
            throw LibraryError.outOfStock
        }
        guard item.points<=coinsDeposited else{
            throw LibraryError.insufficientPoints(coinsNeeded: item.points - coinsDeposited)
        }
        guard name.count>0 else{
            throw LibraryError.invalidInput
        }
        coinsDeposited -= item.points
        
        var newItem=item
        newItem.count-=1 
        books[name]=newItem
        
        print("you issued \(name)")}
    }


var v = Library()
v.coinsDeposited=100
try v.lib(itemNamed:"Atomic Habits")
try v.lib(itemNamed:"Ikigai")
