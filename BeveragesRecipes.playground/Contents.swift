/*
 # WWDC17 Application
 * Marilyn Garcia Medina
 * Mexican College Student
 * 21 years old
 
 Thanks for your time considering my work
 */

import UIKit
import PlaygroundSupport

//Declaration of UI variables needed to display the graphics
var view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 736))
view.backgroundColor = UIColor.white

var beverageImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
beverageImageView.backgroundColor = UIColor.white

var recipeButton = UIButton(frame: CGRect(x: 72, y: 570, width: 270, height: 120))
var backArrow = UIButton(frame: CGRect(x: 0, y: 348, width: 40, height: 40))
var forthArrow = UIButton(frame: CGRect(x: 374, y: 348, width: 40, height: 40))

var recipeTextView = UITextView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
recipeTextView.backgroundColor = UIColor.white
recipeTextView.font = UIFont.init(name: "Avenir-Book", size: 24)
recipeTextView.textAlignment = .justified

//Setup
recipeButton.setImage(UIImage.init(named: "FullRecipeNormal"), for: UIControlState.normal)
backArrow.setImage(UIImage.init(named: "BackArrowNormal"), for: UIControlState.normal)
forthArrow.setImage(UIImage.init(named: "ForthArrowNormal"), for: UIControlState.normal)

//Storage of the graphics that will be displayed
var currentImageIndex = 0
var maxImageIndex = 9
let arrayOfImages = ["Margarita", "CubaLibre", "WhiteRussian", "TequilaSunrise", "Mimosa", "Sangria", "Michelada", "SexOnTheBeach", "HorsesNeck", "BlackRussian"]

view.addSubview(beverageImageView)

recipeTextView.isHidden = true
recipeTextView.isEditable = false

beverageImageView.image = UIImage.init(named: arrayOfImages[currentImageIndex])

class Button: UIButton {
    
    //Setup of the recipe view
     func didPressRecipeButton() {
        recipeTextView.isHidden = false
        
        switch currentImageIndex {
        case 0:
            recipeTextView.text = "Rub the rim of the glass with the lime slice to make the salt stick to it. \n" + "Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. \n" + "Shake the other ingredients with ice, then carefully pour into the glass."
        case 1:
            recipeTextView.text = "Build all ingredients in a Collins glass filled with ice. Garnish with lime wedge."
        case 2:
            recipeTextView.text = "Pour coffee liqueur and vodka into an Old Fashioned glass filled with ice. Float fresh cream on top and stir slowly."
        case 3:
            recipeTextView.text = "Pour the tequila and orange juice into glass over ice. Add the grenadine, which will sink to the bottom. Stir gently to create the sunrise effect. Garnish and serve."
        case 4:
            recipeTextView.text = "Ensure both ingredients are well chilled, then mix into the glass. Serve cold."
        case 5:
            recipeTextView.text = "Have the fruit, rum, wine, and orange juice well chilled. \n" + "Slice the lemon, lime and orange into thin rounds and place in a large glass pitcher. Pour in the rum and syrup. \n" + "Chill in refrigerator for 2 hours to develop the flavors. When ready to serve, crush the fruit lightly with a wooden spoon and stir in the wine and orange juice. \n" + "Adjust sweetness to taste."
        case 6:
            recipeTextView.text = "Mix the beer with clamato juice, freshly squeezed lime juice, and Worcestershire sauce, tabasco sauce, soy sauce, or hot sauce. Add a pinch of salt and pepper."
        case 7:
            recipeTextView.text = "Build all ingredients in a highball glass filled with ice. Garnish with orange slice."
        case 8:
            recipeTextView.text = "Pour brandy and ginger ale directly into highball glass with ice cubes. Stir gently. Garnish with lemon zest. If desired, add dashes of Angostura Bitter."
        case 9:
            recipeTextView.text = "Pour the ingredients into an old fashioned glass filled with ice cubes. Stir gently."
           
        default:
            break
        }
    }
    
    //Button actions to change the image
    func didPressForthButton() {
        currentImageIndex += 1
        if currentImageIndex > maxImageIndex {
            currentImageIndex = 0
        }
        beverageImageView.image = UIImage.init(named: arrayOfImages[currentImageIndex])
    }
    
    func didPressBackButton() {
        currentImageIndex -= 1
        if currentImageIndex < 0 {
            currentImageIndex = maxImageIndex
        }
        beverageImageView.image = UIImage.init(named: arrayOfImages[currentImageIndex])
    }
}

let button = Button()

//Assigment of buttons to their corresponding actions
recipeButton.addTarget(button, action: #selector(Button.didPressRecipeButton), for: UIControlEvents.touchUpInside)
forthArrow.addTarget(button, action: #selector(Button.didPressForthButton), for: UIControlEvents.touchUpInside)
backArrow.addTarget(button, action: #selector(Button.didPressBackButton), for: UIControlEvents.touchUpInside)

beverageImageView.addSubview(recipeButton)
beverageImageView.addSubview(backArrow)
beverageImageView.addSubview(forthArrow)
beverageImageView.addSubview(recipeTextView)

beverageImageView.isUserInteractionEnabled = true
recipeButton.isUserInteractionEnabled = true
backArrow.isUserInteractionEnabled = true
forthArrow.isUserInteractionEnabled = true

PlaygroundPage.current.liveView = beverageImageView
