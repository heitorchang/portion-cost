(defparameter *price-list*
  '(
    a-test 22 ;kg
    bacon 50 ; /kg
    banana 4 ; /kg
    beans 6.93 ; /kg Procon: 6.93
    beef-cubes 36.1 ; /kg Procon: 36.10
    bell-pepper 12 ; /kg, green
    bologna 20 ; /kg
    broccoli 50 ; /kg
    butter 47.5 ; /kg
    canned-tomatoes 17.5 ; /kg
    carrot 3.5 ; /kg
    chicken-breast 24 ; /kg, breast, boneless thigh
    chicken-whole 9.62 ; /kg Procon: 9.62
    coffee 9 ; /kg Procon: 18.18
    condensed-milk 14.55 ; /kg
    cookies-cornstarch 12.7 ; /kg Procon: 12.70
    cookies 12.13 ; /kg Procon: 12.13
    corn-oil 15.54 ; /l
    cornstarch 22 ; /kg
    crackers 11 ; /kg Procon: 11.00
    egg 0.8 ; /unit Procon: 0.70
    french-bread 12.5 ; /kg Procon: 13.22
    flour 3.8 ; /kg, wheat Procon: 3.84
    garlic 27 ; /kg Procon: 29.56
    ground-beef 36.1 ; /kg Procon: 36.10
    ham 28 ; /kg Procon: 28.64
    heavy-cream 20.23 ; /kg
    hondashi 80 ; /kg
    hot-dog-sausage 10 ; /kg Procon: 13.57
    japanese-rice 7.1 ; /kg
    lime 2.99 ; /kg
    manioc-flour 9 ; /kg Procon: 9.36
    margarine 11.44 ; /kg Procon: 11.44
    milk 5.39 ; /l Procon: 3.95
    miso 30 ; /kg
    mozzarella 40 ; /kg Procon: 43.04
    olive-oil 56 ; /l
    onion 3.2 ; /kg Procon: 3.26
    parmesan-cheese 91.8 ; /kg
    pasta 13.58 ; /kg Procon: 5.78
    pork-loin 30 ; /kg
    powdered-milk 32 ; /kg Procon: 31.97
    potato 4 ; /kg Procon: 3.15
    radish 3 ; /kg   
    rice 5 ; /kg Procon: 4.11, 20.56 for 5kg
    sausage 18 ; /kg Procon: 21.15
    soybean-oil 9 ; /l Procon: 8.58
    sliced-bread 13 ; /kg Procon: 10.76
    steak 42 ; /kg, alcatra Procon: 44.86
    sugar 3.2 ; /kg Procon: 3.45
    sweet-potato 2.99 ; /kg
    tomato 8 ; /kg
    tomato-paste 25 ; /kg Procon: 13.67
    wakame 90 ; /kg
    white-mushroom 67 ; /kg
    wine 38.67 ; /l
    ))

(defparameter *recipes*
  '(miso-shiru   
    (portions 2
     ingredients ((radish 0.12)
                  (wakame 0.05)
                  (miso 0.03)
                  (hondashi 0.01)))
    rice-and-beans
    (portions 2
     ingredients ((rice 0.5)
                  (beans 0.3)))))

(defun recipe-cost (recipe)
  (let ((portions (getf (getf *recipes* recipe) 'portions))
        (ingredients (getf (getf *recipes* recipe) 'ingredients)))
    (reduce #'+
            (mapcar #'(lambda (ingr) (/ (* (getf *price-list* (car ingr)) (cadr ingr)) portions))
                    ingredients))))

