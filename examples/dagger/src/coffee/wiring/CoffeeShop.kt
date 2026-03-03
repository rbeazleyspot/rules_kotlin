package coffee.wiring

import coffee.base.CoffeeMaker
import dagger.Component
import generated.GeneratedModule
import javax.inject.Singleton

@Singleton
@Component(modules = [DripCoffeeModule::class, GeneratedModule::class])
interface CoffeeShop {
  fun maker(): CoffeeMaker
}
