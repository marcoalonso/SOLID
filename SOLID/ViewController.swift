//
//  ViewController.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

import UIKit

struct Task {
    let id: UUID
    let title: String
    let isCompleted: Bool
}

// ❌ Sin SRP:
class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String) {
        let task = Task(id: UUID(), title: title, isCompleted: false)
        tasks.append(task)
        print("Saving task: \(task.title)")
    }
}

// ❌ Sin OCP:
class TaskSaver {
    func save(_ task: Task, to type: String) {
        if type == "memory" {
            print("Saved in memory")
        } else if type == "disk" {
            print("Saved on disk")
        }
    }
}

// ❌ Sin LSP:
class Birds {
    func fly() {
        print("Flying")
    }
}

class Penguins: Birds {
    override func fly() {
        fatalError("Penguins can't fly")
    }
}

// ❌ Sin ISP:
protocol TaskActions {
    func save(_ task: Task)
    func delete(_ task: Task)
    func syncToCloud()
}

class SimpleTask: TaskActions {
    func save(_ task: Task) {}
    func delete(_ task: Task) {}
    func syncToCloud() {} // No la necesita
}


// ❌ Sin DIP:
class EmailService {
    func send(_ message: String) {
        print("Sending email: \(message)")
    }
}

class NotificationManager {
    let emailService = EmailService()

    func notify(_ message: String) {
        emailService.send(message)
    }
}


/*
 Principio    ¿Qué soluciona?                                            Analogía práctica
 S          Clases que hacen demasiadas cosas                 Un empleado con 10 trabajos distintos
 O       Código que debes modificar para agregar algo       Enchufe múltiple que puedes extender
 L          Subclases que rompen el sistema               Cambiar una silla por un taburete inseguro
 I          Protocolos gigantescos                         Un contrato que obliga a saber de todo
 D       Acoplamiento fuerte entre clases                 Control remoto que solo sirve para una TV
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let task = Task(id: UUID(), title: "Estudiar SOLID", isCompleted: false)

        // MARK: - ❌ Sin SOLID

        // SRP
        let badTaskManager = TaskManager()
        badTaskManager.addTask(title: task.title)

        // OCP
        let badSaver = TaskSaver()
        badSaver.save(task, to: "disk")

        // LSP
        let penguin = Penguins()
        // penguin.fly() // ⚠️ Esto rompería el programa

        // ISP
        let simpleTask = SimpleTask()
        simpleTask.syncToCloud() // Método que no necesita, pero está obligado a tenerlo

        // DIP
        let notificationManager = NotificationManager()
        notificationManager.notify("¡Tarea completada!")

        // MARK: - ✅ Con SOLID

        // SRP
        let goodTaskManager = TaskManager()
        goodTaskManager.addTask(title: "Grabar video de SOLID")

        // OCP
        let inMemoryStorage = InMemoryStorage()
        let taskService = TaskService(storage: inMemoryStorage)
        taskService.addTask(title: "Editar miniatura")

        // LSP
        let eagle: Bird = Eagle()
        eagle.move()

        let penguin2: Bird = Penguin()
        penguin2.move()

        // ISP
        let deletableTask: Deletable = TaskDeleter()
        deletableTask.delete(task)

        // DIP
        let smsNotifier = TaskNotifier(service: SMSNotificationService())
        smsNotifier.notifyTaskAdded(task)
    }
}

class TaskDeleter: Deletable {
    func delete(_ task: Task) {
        print("Tarea eliminada: \(task.title)")
    }
}

