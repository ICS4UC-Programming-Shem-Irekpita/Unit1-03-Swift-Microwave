import Foundation

/// This program calculates the microwave reheating time for specific food items and quantities.
///
/// - Authors: Shem Irekpita
/// - Version: 1.0
/// - Date: 2026-09-22

@main
struct Microwave {
    static func main() {
        print("This program is to calculate the microwave time")
        print("Please enter the item you want to reheat (sub, pizza, soup): ", terminator: "")

        // Read food item input
        guard let inputChoice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() else {
            print("Error: Could not read input.")
            return
        }

        // Determine base time based on item choice
        let baseTime: Double
        switch inputChoice {
        case "sub":
            baseTime = 60.0
        case "pizza":
            baseTime = 45.0
        case "soup":
            baseTime = 105.0
        default:
            print("Error: Please enter a proper input.")
            return
        }

        print("Please enter how many items you wanna reheat (Max 3): ", terminator: "")

        // Read quantity input and validate integer parsing
        guard let inputString = readLine(), let amount = Int(inputString.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            print("Error: Please enter a valid numeric value.")
            return
        }

        // Calculate time scale multiplier
        let multiplier: Double
        switch amount {
        case 1:
            multiplier = 1.0
        case 2:
            multiplier = 1.5
        case 3:
            multiplier = 2.0
        default:
            print("Error: Quantity must be 1, 2, or 3.")
            return
        }

        // Calculate total duration and format output
        let totalSeconds = baseTime * multiplier
        let roundedSeconds = Int(totalSeconds.rounded())
        let minutes = roundedSeconds / 60
        let seconds = roundedSeconds % 60

        print()
        print("Total time: \(roundedSeconds) seconds (\(minutes) min \(seconds) sec)")
    }
}