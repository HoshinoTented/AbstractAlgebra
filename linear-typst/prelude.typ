#import "@preview/ctheorems:1.1.3": *

#let private_counter = "theorem_definition"

#let theorem = thmbox(private_counter, "Theorem")
#let definition = thmbox(private_counter, "Definition")
#let exercise = thmplain("exercise", "Exericse", base_level: 0)   // base_level: 0 to remove section number from numbering
#let proof = thmproof("proof", "Proof", separator: [#h(0.1em).#h(0.2em)])

#let template(chapter) = (doc) => [
  #set text(font: ("Libertinus Serif", "Noto Sans CJK SC"))
  #set heading(numbering: "1.")
  #counter(heading).update((chapter,))
  #show: thmrules
  #show ref: it => {
    if it.element == none { return it }
    if not it.element.has("caption") { return it }
    
    let caption = it.element.caption
    if caption == none { return it }

    let body = it.element.caption.body
    if body == none { return it }
    
    link(it.target, body)
  }

  #doc
]

// join functions

#let join(
  separator: [,],
  element_provider,
  start: 0,
  until
) = {
  if type(element_provider) == content or type(element_provider) == str {
    element_provider = (i) => $#element_provider _ #i$
  }

  $#element_provider(start) #separator dots.c #separator #element_provider(until)$
}

#let join1 = join.with(start: 1)
#let joinp = (l, r, until, ..args) => join((i) => $#l _ #i #r _#i$, until, ..args)
#let lc = join.with(separator: $+$)
#let lcp = joinp.with(separator: $+$)
#let op = join.with(separator: $plus.circle$)
#let ip(l, r) = $lr(angle.l #l , #r angle.r)$
#let norm(term) = $lr(|| #term ||)$

// orthogonal decompose
// v = <v, e_0> v + ...
#let od(v, e, until, ..args) = lc((i => $ip(v, e_#i) e_#i$), until, ..args)

// common math functions

#let iff = $arrow.l.r.double.long$
#let lt = $cal(L)$
#let rangev = math.op("range")
#let spanv = math.op("span")
#let nullv = math.op("null")
#let dim = math.op("dim")
#let inv = $-1$
#let pinv = math.dagger
#let nR = math.bold("R")
#let real = math.op("Re")
#let imag = math.op("Im")

// TODO: support base_level
#let thmcounter(identifier, base: "heading", value: none) = context {
  let counters = thmcounters.get().at("counters")
  // counters[heading] play a tmp variable role, used when counters.at("heading"), reuses some logic
  counters.at("heading") = counter(heading).get()
  let hc = counters.at(base)   // array

  if value == none {
    if not identifier in counters.keys() {
      return (..hc, 0)
    }

    let tc = counters.at(identifier)   // tc.slice(0, -1) is heading counter, the last one is theorem counter
    // tc.slice(0, -1) never empty unless hc is empty
    if tc.slice(0, -1) == hc {
      tc
    } else {
      (..hc, 0)
    }
  } else {
    // we must use update, typst copies data, thus
    // `thmcounters.get().at("...") = ...` doesn't work.
    thmcounters.update(thmpair => {
      let counters = thmpair.at("counters")
      let latest = thmpair.at("latest")     // keep

      counters.at(identifier) = value

      return (
        counters: counters,
        latest: latest
      )
    })
  }
}