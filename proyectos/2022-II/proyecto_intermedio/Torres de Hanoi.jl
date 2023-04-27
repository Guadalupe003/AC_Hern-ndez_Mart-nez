### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 1032152a-4644-4ef5-bd16-c9ba083ccb42
md"TORRES DE HANOI"

# ╔═╡ 6f3e8859-6408-47e3-93a1-d8b64bb4db27
md"El juego de las Torres de Hanoi consiste en tres estacas (izquierda, central y derecha) y n discos redondos de diferentes radios (perforados de forma que puedan encajar en las estacas). Inicialmente la estaca de la izquierda tiene todos los discos en orden creciente de tamaño de abajo hacia arriba."

# ╔═╡ 6bc87d1d-cfa0-464f-a1d3-e6d6fee972b7
md"El objetivo del juego es mover todos los discos a la estaca de la derecha, usando la estaca central. En cada movimiento se desplaza el disco del extremo superior de una estaca a la otra, con la restricción de que no está permitido que un disco de radio mayor quede encima de uno de radio menor."

# ╔═╡ 8a874bc6-8e13-4bdd-983e-62c0459ebc6a
md"Tu tarea es encontrar la secuencia de pasos que minimice el número de movimientos necesarios para cumplir el objetivo del juego. Es decir:"

# ╔═╡ 5f96beea-2772-467a-8be0-1be21e0440c8
md"Entada:"

# ╔═╡ 257951d6-affb-4cfc-ab65-49b0f34a3c61
md"Un valor entero positivo n (el número de discos)."

# ╔═╡ 5c3525a3-a673-44cd-9456-5527773e86a7
md"Salida:"

# ╔═╡ 4c72f972-95b0-43a1-b34d-129e1281a57e
md"Imprime el entero k: el número mínimo de movimientos.\
Posteriormente imprime k líneas que describan la secuencia de movimientos. Cada línea debe tener dos enteros, a y b, que indican el movimiento: mover el disco de la estaca a a la estaca b, con a, b ∈ 1, 2, 3. Se considera que 1 es el disco de la izquierda, 2 el central y 3 el de la derecha."

# ╔═╡ 6986b185-bbef-4cc4-913b-d7e374c62752
md"1. Diseña un algoritmo que resuelva este problema y justifica (no es necesario escribir una demostración) por qué devuelve el número mínimo de movimientos. Represéntalo en pseudocódigo o diagrama de flujo (4 puntos). El diagrama se puede observar en el siguiente link: https://lucid.app/lucidchart/9bf6255d-14fe-4903-bab2-77b02f08a214/edit?invitationId=inv_4864a33a-c7cb-4c9c-8cf6-f7a0e74f64da&page=0_0#
Justificación:\
Como necesitamos cambiar a_n discos esto se puede ver escribir, como:
	a_n=a_(n-1)+1+a_(n-1)\
donde a_(n-1) nos indica los n-1 discos que debemos cambiar a la torre auxiliar, mientras que el 1 nos indica el disco más grande que pasa de la torre inicial a la final y finalmente, a_(n-1) nos indica los n-1 discos que van a pasar de la torre auxiliar a la inicial.Desarrollando esto, tenemos:\
	a_n=2*a_(n-1)+1\
Si n=2, entonces:
	a_2=2*1+1=3\
Si n=3, entonces:
	a_3=2*3+1=7\
Si n=4, entonces:
	a_4=2*7+1=15\
Y justo es esta sucesión: 1,2,7,15 que se puede escribir como: 2^n-1


2. Implementa el algoritmo en Julia. Tu programa será aceptado si devuelve las respuestas correctas para cada n, con 1 ≤ n ≤ 16. (6 puntos)"


# ╔═╡ d404038a-59de-480f-9955-d7334cc55243
begin

	#Comencemos definiendo nuestra función y las variables con las que trabajaremos:)
	function torres_hanoi(n_discos,inicial,auxiliar,final)

		#Caso base
		if (n_discos==1)
			println("Mueve el disco desde la torre ", inicial , " hasta la torre ", final,)

		else
		#Si n es distinto de 1 entonces procedemos a hacer el otro caso, el cual consiste en mover los n-1 discos a la torre auxiliar que en este caso será nuestro destino (por el momento)
			torres_hanoi(n_discos-1,inicial,final,auxiliar)
			println("Mueve el disco ",n_discos, " desde la torre ", inicial , " hasta la torre ", final,)
		#Ahora mi "inicio" va a ser mi torre que actúa como auxiliar, para posteriormente llevarla a mi torre final
			torres_hanoi(n_discos-1,auxiliar,inicial,final)
		end
		
	end#Aquí termina la función
	
end

# ╔═╡ fe8da3ba-fef0-48d3-bff1-b7437d51baba
torres_hanoi(4,1,2,3)

# ╔═╡ Cell order:
# ╟─1032152a-4644-4ef5-bd16-c9ba083ccb42
# ╟─6f3e8859-6408-47e3-93a1-d8b64bb4db27
# ╟─6bc87d1d-cfa0-464f-a1d3-e6d6fee972b7
# ╟─8a874bc6-8e13-4bdd-983e-62c0459ebc6a
# ╟─5f96beea-2772-467a-8be0-1be21e0440c8
# ╟─257951d6-affb-4cfc-ab65-49b0f34a3c61
# ╟─5c3525a3-a673-44cd-9456-5527773e86a7
# ╟─4c72f972-95b0-43a1-b34d-129e1281a57e
# ╟─6986b185-bbef-4cc4-913b-d7e374c62752
# ╠═d404038a-59de-480f-9955-d7334cc55243
# ╠═fe8da3ba-fef0-48d3-bff1-b7437d51baba
