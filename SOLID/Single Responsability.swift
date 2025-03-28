//
//  Single Responsability.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

/*
 S – Single Responsibility Principle (Responsabilidad Única)
🧠 ¿Qué significa?
Una clase debe tener una sola razón para cambiar.

🧍‍♂️ Analogía:
Imagina una persona que hace de chef, mesero y cajero al mismo tiempo. Si se enferma, el restaurante colapsa. Lo mismo pasa con una clase que hace demasiadas cosas.

💻 En código:
Una clase debería encargarse solo de una cosa: guardar usuarios, enviar correos, o leer datos, pero no todo junto.
 */

import Foundation

class TaskRepository {
    private var tasks: [Task] = []

    func save(task: Task) {
        tasks.append(task)
    }
}

class TaskLogger {
    func log(_ message: String) {
        print(message)
    }
}

class TaskManagerS {
    private let repository = TaskRepository()
    private let logger = TaskLogger()

    func addTask(title: String) {
        let task = Task(id: UUID(), title: title, isCompleted: false)
        repository.save(task: task)
        logger.log("Task saved: \(task.title)")
    }
}
