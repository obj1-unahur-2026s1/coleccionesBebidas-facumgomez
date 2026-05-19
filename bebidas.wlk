object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuado {
  const frutas = []

  method agregarFrutas(fruta) { frutas.add(fruta) }

  method redimientoQueOtorga(dosisConsumida) = (dosisConsumida / 1000) * frutas.sum({ i => i.nutrientes()})
}

object aguaSaborizada {
  method rendimientoQueOtorga(dosisConsumida, saborizante) = 1 + saborizante.rendimientoQueOtorga(dosisConsumida / 4)
}

object coctel {
  const bebidas = []

  method agregarBebida(bebida) { bebidas.add(bebida) }
  method rendimientoQueOtorga(dosisConsumida) =  bebidas.float({ b => b.redimientoQueOtorga(dosisConsumida) }) 
}