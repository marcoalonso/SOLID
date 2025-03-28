//
//  LiskovSubstitution.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

/*
 🔁 L – Liskov Substitution Principle (Sustitución de Liskov)
 🧠 ¿Qué significa?
 Debes poder usar una subclase en lugar de su clase base sin que el código falle.

 🧍‍♂️ Analogía:
 Si una silla es una "silla", puedes cambiarla por otra silla sin problema. Pero si la sustituyes por un taburete que no tiene respaldo y el cliente se cae… ya no es una silla, rompe la lógica.

 💻 En código:
 Una subclase debe respetar el comportamiento del padre. No puede lanzar errores, ignorar métodos, ni hacer cosas inesperadas.
 */
import Foundation
protocol Bird {
    func move()
}

class Eagle: Bird {
    func move() {
        print("Flying")
    }
}

class Penguin: Bird {
    func move() {
        print("Walking")
    }
}
