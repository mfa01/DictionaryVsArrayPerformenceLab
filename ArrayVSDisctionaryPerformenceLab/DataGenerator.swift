//
//  DataGenerator.swift
//  ArrayVSDisctionaryPerformenceLab
//
//  Created by Mohammad Alabed on 01/06/2022.
//

import Foundation

class DataGenerator {

    private let rowsNumber: Int = 4000000
    static var shared = DataGenerator()

    private var array:[DummyModel] = []
    private var dict:[Int:DummyModel] = [:]
    private var set = Set<DummyModel>()
    private var dataGenerated = false

    private func createDataIfNoDataGeneratedYest() {
        if dataGenerated == false {
            generateArray()
            generateDict()
        }
    }

    /// Generate records in array
    func generateArray(){

        for i in 0...rowsNumber {
            array.append(DummyModel(name: "Person Name\(i)", age: i, city: "City Name \(i)", street: "Street\(i)", phone: "Phone number: \(i)"))
        }
        dataGenerated = true
    }

    /// Generate records in dictionary
    func generateDict(){

        for i in 0...rowsNumber {
            dict[i] = DummyModel(name: "Person Name\(i)", age: i, city: "City Name \(i)", street: "Street\(i)", phone: "Phone number: \(i)")
        }
    }

    /// Generate records in set
    func generateSet(){

        for i in 0...rowsNumber {
            set.insert(DummyModel(name: "Person Name\(i)", age: i, city: "City Name \(i)", street: "Street\(i)", phone: "Phone number: \(i)"))
        }
    }


    enum ObjectType {
        case array
        case dict
    }

    enum OperationType {
        case create
        case access
        case search
        case append
        case insert
        case delete
        case update
        case updateAll
    }

    func check(type: ObjectType, opType: OperationType) -> String {
        
        if opType != .create {
            createDataIfNoDataGeneratedYest()
        }
        var result: Double = 0.0
        switch opType {
        case .create:
            result = checkCreatingTime(type: type)
        case .access:
            result = checkAccessTime(type: type)
        case .search:
            result = checkSearchTime(type: type)
        case .append:
            result = checkAppendTime(type: type)
        case .insert:
            result = checkAppendAtMiddleTime(type: type)
        case .delete:
            result = checkDeleteTime(type: type)
        case .update:
            result = checkUpdateTime(type: type)
        case .updateAll:
            result = checkUpdateAllElementsTime(type: type)
        }
        return String(format: "%f", result) + " Seconds"
    }

    private func checkCreatingTime(type: ObjectType) -> Double {

        switch type {
        case .array:
            let timer = ParkBenchTimer()
            generateArray()
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            generateDict()
            return timer.stop()
        }
    }

    private func checkAccessTime(type: ObjectType) -> Double {

        let randomIndex = Int(arc4random())%rowsNumber
        let timer = ParkBenchTimer()
        switch type {
        case .array:
            let _ = array[randomIndex]
            return timer.stop()
        case .dict:
            let _ = dict[randomIndex]
            return timer.stop()
        }
    }

    private func checkSearchTime(type: ObjectType) -> Double {

        switch type {
        case .array:
            let timer = ParkBenchTimer()
            let _ = array.first { item in
                item.age == 1000000
            }
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            let _ = dict.values.first(where: { item in
                item.age == 1000000
            })
            return timer.stop()
        }
    }

    private func checkAppendTime(type: ObjectType) -> Double {

        let model = DummyModel(name: "newElement", age: 101010, city: "city", street: "street", phone: "phone")
        switch type {
        case .array:
            let timer = ParkBenchTimer()
            array.append(model)
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            dict[19029109201] = model
            return timer.stop()
        }
    }

    private func checkAppendAtMiddleTime(type: ObjectType) -> Double {

        let model = DummyModel(name: "newElement2", age: 101010, city: "city", street: "street", phone: "phone")
        switch type {
        case .array:
            let timer = ParkBenchTimer()
            array.insert(model, at: 1000000)
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            dict[21212121] = model
            return timer.stop()
        }
    }

    private func checkDeleteTime(type: ObjectType) -> Double {

        switch type {
        case .array:
            let timer = ParkBenchTimer()
            array.remove(at: 1000000)
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            dict[1000000] = nil
            return timer.stop()
        }
    }

    private func checkUpdateTime(type: ObjectType) -> Double {

        let model = DummyModel(name: "newElement", age: 101010, city: "city", street: "street", phone: "phone")
        switch type {
        case .array:
            let timer = ParkBenchTimer()
            array[100000] = model
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            dict[100000] = model
            return timer.stop()
        }
    }

    private func checkUpdateAllElementsTime(type: ObjectType) -> Double {

        switch type {
        case .array:
            let timer = ParkBenchTimer()
            for (index, item) in array.enumerated() {
                array[index].age = item.age + 1
            }
            return timer.stop()
        case .dict:
            let timer = ParkBenchTimer()
            let keys = dict.keys
            for key in keys {
                var value = dict[key]
                let age = value?.age ?? 0
                value?.age = age + 1
                dict[key] = value
            }
            return timer.stop()
        }
    }
}
