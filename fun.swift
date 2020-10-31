
enum StudentError: Error {
    case invalid(String)
    case tooShort
}

class Student {
    var name: String?
    init(name: String?) throws {
        guard let name = name else{
            throw StudentError.invalid("Invalid")
        }
        self.name = name }

    func myName(str: String) throws -> String {

        guard str.count > 5
            else{
                throw StudentError.tooShort
        }

        return "My name is \(str)"
    }
}
//try adding same type of codes ... i work in swift so suggesting this way
