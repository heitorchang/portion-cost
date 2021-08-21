from price_list import PRICE_LIST
from recipes import RECIPES

def list_recipes():
    print("\n".join(RECIPES.keys()))

    
def ingredient_and_cost(recipe_ingredient):
    name, amount = recipe_ingredient
    return [name, PRICE_LIST[name] * amount]


def ingredient_cost(recipe_ingredient, amount):
    return PRICE_LIST[recipe_ingredient] * amount


def portion_cost_only(recipe_name):
    recipe = RECIPES[recipe_name]
    ingredients = recipe["ingredients"]
    portions = recipe["portions"]
    costs_only = [ingredient_cost(ingr, amount) for ingr, amount in ingredients.items()]
    total = " R$ {:.2f}".format(sum(costs_only) / portions)
    return f"{recipe_name} {total}"


def recipes_cost():
    for cost in [portion_cost_only(recipe_name) for recipe_name in RECIPES]:
        print(cost)
        
"""
(defn portion_cost
  "Recipe should be a map with keys :ingredients (also a map, with ingredient names as keys and amounts as values)
  and :portions, indicating the number of portions that the given ingredients yield.

  Example: (portion_cost (recipes :miso_shiru))
  "
  [recipe_name]
  (let [recipe (recipes recipe_name)
        ingredients (recipe :ingredients)
        portions (recipe :portions)
        recipe_ingredient_costs (map ingredient_and_cost ingredients)
        portion_ingredient_costs (map #(list (first %) (format "R$ %.2f" (/ (second %) portions 1.0))) recipe_ingredient_costs)
        costs_only (map ingredient_cost ingredients)
        total (format "Total: R$ %.2f" (/ (reduce + costs_only) portions 1.0))]
    (println (string/join "\n" portion_ingredient_costs))
    (println)
    total))

(defn recipes_cost []
  (let [costs (map portion_cost_only recipes)]
    (doseq [cost costs]
      (println cost))))
"""
