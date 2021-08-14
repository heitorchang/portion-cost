;; Given a map of ingredient prices per unit, compute the cost of a portion of a recipe

(require '[clojure.string :as string])

(load "price-list")
(load "recipes")

(defn list-recipes []
  (println (string/join "\n" (keys recipes))))

(defn ingredient-and-cost
  "Given a pair [ingredient-name amount], compute its cost (referring to *price-list*)"
  [recipe-ingredient]
  (let [name (first recipe-ingredient)
        amount (second recipe-ingredient)]
    [name (* (*price-list* name) amount)]))

(defn ingredient-cost
  "Given a pair [ingredient-name amount], compute its cost (referring to *price-list*)"
  [recipe-ingredient]
  (* (*price-list* (first recipe-ingredient)) (second recipe-ingredient)))

(defn portion-cost
  "Recipe should be a map with keys :ingredients (also a map, with ingredient names as keys and amounts as values)
  and :portions, indicating the number of portions that the given ingredients yield.

  Example: (portion-cost (recipes :miso-shiru))
  "
  [recipe-name]
  (let [recipe (recipes recipe-name)
        ingredients (recipe :ingredients)
        portions (recipe :portions)
        recipe-ingredient-costs (map ingredient-and-cost ingredients)
        portion-ingredient-costs (map #(list (first %) (format "R$ %.2f" (/ (second %) portions 1.0))) recipe-ingredient-costs)
        costs-only (map ingredient-cost ingredients)
        total (/ (reduce + costs-only) portions 1.0)]
    (println (string/join "\n" portion-ingredient-costs))
    (println)
    (println (format "Total: R$ %.2f" total))
    '.))
