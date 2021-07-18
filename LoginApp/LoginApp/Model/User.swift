//
//  User.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 18.07.2021.
//

struct User {
    var login: String
    var password: String
    var person: Person
}

struct Person {
    var name: String
    var surname: String
    var age: Int
    var profession: String
    var hobby: String
    var moreInfo: String
}

extension User {
    
    static func getUser() -> User {
        return User(login: "User",
                    password: "Password",
                    person: Person(name: "Tadevos",
                                   surname: "Kurdoglian",
                                   age: 31,
                                   profession: "врач-рентгенолог",
                                   hobby: "спорт, фильмы, сериалы, видеоигры, комиксы",
                                   moreInfo: "Мне больше нечего сказать 🙃")
        )
    }
}
