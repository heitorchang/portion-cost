(def recipes
  { ; keep in alphabetical order
   :a-test {:ingredients {:a-test 10
                          }
            :portions 2}

   :coq-au-vin {:ingredients {:chicken-breast 0.7
                              :onion 0.2
                              :bacon 0.1
                              :white-mushroom 0.2
                              :flour 0.02
                              :butter 0.02
                              :wine 0.15
                              :corn-oil 0.02
                              :garlic 0.05}
                :portions 4}
   
   :gohan {:ingredients {:japanese-rice 0.3}
           :portions 4}
   
   :miso-shiru {:ingredients {:radish 0.12
                              :wakame 0.05
                              :miso 0.03
                              :hondashi 0.01}
                :portions 2}
   
   :pasta-bolognese {:ingredients {:pasta 0.25
                                   :garlic 0.05
                                   :onion 0.15
                                   :parmesan-cheese 0.08
                                   :tomato-paste 0.3
                                   :ground-beef 0.3
                                   }
                     :portions 2}

   :rice-and-beans {:ingredients {:rice 0.5
                                  :beans 0.25}
                    :portions 4}
   
   }) ; end recipes