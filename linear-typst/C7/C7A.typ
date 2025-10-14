#import "../prelude.typ": *
#show: template(7)

We will assume $V$ and $W$ are finite inner product vector spaces in this chapter.

#definition[
  Let $T in lt(V, W)$. The adjoint of $T$ is a function $T^*$, such that for all $v in V$ and $w in W$:
  $
    ip(T v, w)_W = ip(v, T^* w)_V
  $
  holds.
]

#thmcounter(private_counter, value: (7, 3))

#theorem[Adjoint is Linear Map][
  Let $T in lt(V, W)$, then $T^* in lt(W, V)$
]
#proof[
  - (Additivity): For any $w, w' in W$ and $v in V$, we have 
    $
      ip(T v, w + w') &= ip(v, T^* (w + w')) \
      ip(T v, w) + ip(T v, w') &= ip(v, T^* (w + w')) \
      ip(v, T^* w) + ip(v, T^* w') &= ip(v, T^* (w + w')) \
      ip(v, T^* w + T^* w') &= ip(v, T^* (w + w')) \
    $
    Thus linear functorial $v |-> ip(v, T^* w + T^* w')$ and $v |-> ip(v, T^* (w + w'))$ are equal, then by Riesz Representation Theorem, we know $T^* w + T^* w' = T^* (w + w')$ cause $v |-> ip(dot, v)$ is injective.
  - (Homogeneity) For any $lambda in F$, $w in W$ and for all $v in V$, we have
    $
      ip(T v, lambda w) &= ip(v, T^* (lambda w)) \
      overline(lambda) ip(T v, w) &= ip(v, T^* (lambda w)) \
      overline(lambda) ip(v, T^* w) &= ip(v, T^* (lambda w)) \
      ip(v, lambda T^* w) &= ip(v, T^* (lambda w)) \
    $
    thus $lambda T^* w = T^* (lambda w)$
]

#theorem[Properties of Adjoint][
  #set enum(numbering: "a)")
  Let $T in lt(V, W)$, then:
  + $(S + T)^* = S^* + T^*$ for all $S, T in lt(V, W)$
  + $(lambda T)^* = overline(lambda) T^*$ for all $lambda in F$
  + $(T^*)^* = T$
  + $(S T)^* = T^* S^*$ for all $S in lt(W, U)$ where $U$ is finite inner product space over $F$.
  + $I^* = I$
  + If $T$ is invertible, then $T^*$ is invertible and $(T^inv)^* = (T^*)^inv$
]
#proof[
  For all $v in V$ and $w in W$:
  + $ip((S + T) v, w) = ip(S v + T v, w) = ip(S v, w) + ip(T v, w) = ip(v, S^* w) + ip(v, T^* w) = ip(v, (S + T)^*(w))$, thus $S^* w + T^* w = (S + T)^* w$
  + $ip((lambda T) v, w) = ip(lambda (T v), w) = lambda ip(T v, w) = lambda ip(v, T^* w) = ip(v, overline(lambda) T^* w) = ip(v, (lambda T)^* w)$
  + $ip(T^* w, v) = overline(ip(v, T^* w)) = overline(ip(T v, w)) = ip(w, T v) = ip(w, (T^*)^* v)$
  + For any $u in U$, $ip(S T v, u) = ip(S(T v), u) = ip(T v, S^* u) = ip(v, T^* S^* u)$
  + $ip(I v, w) = ip(v, w) = ip(v, I w) = ip(v, I^* w)$
  + $I = I^* = (T T^inv)^* = (T^inv)^* T^*$.
    Similarly, $I = I^* = (T^inv T)^* = T^* (T^inv)^*$, thus $(T^inv)^*$ is the inverse of $T^*$.
]

#theorem[Nullspace and Range of Adjoint][
  #set enum(numbering: "a)")

  Let $T in lt(V, W)$, then:
  + $nullv T^* = (rangev T)^perp$
  + $rangev T^* = (nullv T)^perp$
  + $nullv T = (rangev T^*)^perp$
  + $rangev T = (nullv T^*)^perp$
] <N-R-Adjoint>
#proof[
  - (a) For any $v in V$ and $w in W$, we have $ip(T v, w) = ip(v, T^* w)$, then $w in nullv T^*$ implies $ip(T v, w) = 0$ (for all $v in V$), therefore $w perp rangev T$, thus $w in (rangev T)^perp$; and $w in (rangev T)^perp$ implies $T^* w perp V$, which means $T^* w = 0$, therefore $w in nullv T^*$.
  - (c) By replacing $T$ in (a) with $T^*$, we get $nullv (T^*)^* = nullv T = (rangev T^*)^perp$
  - (b) $rangev T^* = ((rangev T^*)^perp)^perp = (nullv T)^perp$ by (c)
  - (d) Using the same way as (c) did but on $(b)$.
]

#thmcounter(private_counter, value: (7, 15))

#theorem[
  Let $T$ is self-adjoint operator over $V$, then:
  $
    ip(T v, v) = 0 "for all" v in V iff T = 0
  $
]

#thmcounter(private_counter, value: (7, 19))

#theorem[
  Let $T in lt(V)$, then:
  $
    T "is normal" iff norm(T v) = norm(T^* v) "for all" v in V
  $
] <Normal-Same-Norm>

#theorem[
  #set enum(numbering: "a)")
  Let $T in lt(V)$ normal, then:
  + $nullv T = nullv T^*$
  + $rangev T = rangev T^*$
  + $V = nullv T plus.circle rangev T$
  + For all $lambda in F$, $T - lambda I$ is normal
  + Let $v in V$ and $lambda in F$, then $T v = lambda v iff T^* v = overline(lambda) v$
]
#proof[
  + For all $v in V$, we have $norm(T v) = norm(T^* v)$ by @Normal-Same-Norm, thus $v in nullv T iff v in nullv T^*$.
  + $rangev T = (nullv T^*)^perp$ and $rangev T^* = (nullv T)^perp$ by @N-R-Adjoint, thus $nullv T^* = nullv  T$ therefore $rangev T = rangev T^*$
  + Let $v in nullv T inter rangev T$, then there is $w in V$ such that $v = T w$.
    Then:
    $
      ip(v, v) &= ip(T w, v) \
      &= ip(w, T^* v) \
      &= ip(w, 0) quad "by" v in nullv T "and" nullv T = nullv T^* \
      &= 0
    $
    therefore $v = 0$, hence $nullv T inter rangev T = {0}$ and $nullv T plus.circle rangev T$. Therefore $V = nullv T plus.circle rangev T$ (Recall that we assume $V$ is finite in the beginning of this chapter).
  + For any $lambda in F$, let $T' = T - lambda I$ and $T'^* = (T - lambda I)^* = T^* - (lambda I)^* = T^* - overline(lambda) I$. Then for any $v in V$
    $
      T' T'^* v &= (T - lambda I)(T^* - overline(lambda) I) v \
      &= (T - lambda I)(T^* v - overline(lambda)v) \
      &= T T^* v - T overline(lambda) v - lambda T^* v + |lambda|^2 v \
      &= T^* T v - overline(lambda) T v - T^* lambda v + |lambda|^2 v \
      &= (T^* - overline(lambda) I)(T v - lambda v) \
      &= (T - lambda I)^*(T  - lambda I) v \
      &= T'^* T' v
    $
  - Let $v in V$ and $lambda in F$, we know $T - lambda I$ is normal, then $nullv (T - lambda I) = nullv (T - lambda I)^* = nullv (T^* - overline(lambda) I)$, thus $T^* v - overline(lambda) v = 0$, which means $T^* v = overline(lambda) v$.
]

#theorem[TODO]

#theorem[
  Let $F = C$ and $T in lt(V)$, then $T$ is normal $iff$ there are commutive self-adjoint operator $A, B in lt(V)$ such that:
  $
    T = A + i B.
  $

  If we treat $lt(V)$ as $C$, then $A$ and $B$ are the real part and imagine part respectivly. Also recall that $T^*$ is some kind of conjugate.
]
#proof[
  Follow the idea of treating $lt(V)$ as $C$, we may want $A = 1/2(T + T^*)$ and $B = (1/2)(-i)(T - T^*)$, as we did for complex number: $(a + i b) + (a - i b) = 2 a$ and $(a + i b) - (a - i b) = 2 i b$.

  ($arrow.double$) Then we must show that $A$ and $B$ are adjoint and $T = A + i B$.
  - $A^* = (1/2(T + T^*))^* = 1/2 (T + T^*)^* = 1/2 (T^* + T) = A$
  - $B^* = (1/2(-i)(T - T^*))^* = 1/2 i (T - T^*)^* = 1/2 i (T^* - T) 1/2 (-i) (T - T^*) = B$
  - $A + i B = 1/2 (T + T^*) + i 1/2 (-i)(T - T^*) = 1/2 (T + T^* + (T - T^*)) = 1/2 (2 T) = T$.

  We also need to show that $A B = B A$, then $A B = B A = (T^2 - (T^*)^2)/(4i)$

  ($arrow.l.double$) Just calculate, recall that $A$ and $B$ are commute.
]