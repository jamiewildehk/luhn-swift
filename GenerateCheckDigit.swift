#!/usr/bin/swift
let codePoints = ["2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "P", "R", "Q", "T", "V", "X", "N", "Z"];


func CodePointFromCharacter(input :String) -> Int? {
    return codePoints.index(of: input);
}

func CharacterFromCodePoint(input :Int) -> String {
    return codePoints[input];
}

func ValidateString(input: String) -> Bool {
  for char in input.characters {
    if (CodePointFromCharacter(input: String(char)) == nil) {
      return false;
    }
  }
  return true;
}

func GenerateCheckCharacter(input :String) -> String? {


	var factor = 2;
	var sum = 0;
	let n =  codePoints.count;

	// Starting from the right and working leftwards is easier since 
	// the initial "factor" will always be "2" 
	for index in input.characters.reversed() {
		let codePoint = CodePointFromCharacter(input: String(index))!;
		var addend = factor * codePoint;

		// Alternate the "factor" that each "codePoint" is multiplied by
		factor = (factor == 2) ? 1 : 2;

		// Sum the digits of the "addend" as expressed in base "n"
		addend = (addend / n) + (addend % n);
		sum += addend;
	}

	// Calculate the number that must be added to the "sum" 
	// to make it divisible by "n"
	let remainder = sum % n;
	let checkCodePoint = (n - remainder) % n;

  return CharacterFromCodePoint(input: checkCodePoint);
}

func ValidateCheckCharacter(input :String) -> Bool {

	var factor = 1;
	var sum = 0;
	let n = codePoints.count;

	// Starting from the right, work leftwards
	// Now, the initial "factor" will always be "1" 
	// since the last character is the check character
	for index in input.characters.reversed() {
		let codePoint = CodePointFromCharacter(input: String(index))!;
		var addend = factor * codePoint;

		// Alternate the "factor" that each "codePoint" is multiplied by
		factor = (factor == 2) ? 1 : 2;

		// Sum the digits of the "addend" as expressed in base "n"
		addend = (addend / n) + (addend % n);
		sum += addend;
	}

	let remainder = sum % n;

	return (remainder == 0);
}


for arg in CommandLine.arguments.dropFirst(1) {
  if (ValidateString(input: arg)) {
    if let checkDigit = GenerateCheckCharacter(input: arg) {
      print("\(arg)\(checkDigit) ");
    } else {
      print("\(arg): Error");
    }
  } else {
    print("\(arg): Invalid String");
  }
}

