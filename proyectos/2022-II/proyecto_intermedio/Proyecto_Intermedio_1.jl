### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 2c7c0cc4-a1e1-4650-ad23-0a0bd18afe71
md"ALGORITMOS COMPUTACIONALES
							
						
									PROYECTO INTERMEDIO

						
Nombre de las estudiantes:
						
Guadalupe del Rocío Hernandez
						
Paz Flores Arantza Pamela"

# ╔═╡ c3ca5555-664f-4c99-9a58-d179052fd213
md"RANA SALTARINA"

# ╔═╡ 7d21a98f-306c-405c-9139-25d406644529
md"Este ejercicio nos pide encontar todas las maneras posibles en la cuál una rana puede saltar una cantidad n de rocas de un lado del río hacia el otro; las condiciones iniciales son que la rana empieza del lado izquierdo del río, la rana solo puede dar saltos de 1 o 2 rocas a la vez y no puede regresar, también nos piden que los valores esten definidos para 1≤n≤45 y el código debe dar todas las soluciones posibles N."

# ╔═╡ a11dbe66-f2dd-484b-a75b-79738f21c29e
md"1. Para la primera parte del ejercicio se creó un diagrama de flujo que describe el comportamiento del código de la rana, para poder ver el diagrama se debe acceder al siguiente link:"

# ╔═╡ 62de0547-dd1d-4e0c-9d81-c900d8a92b21
md"https://www.canva.com/design/DAFhDeigQIk/KJWabCMfI0ah8NJZhoyK3Q/edit?utm_content=DAFhDeigQIk&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton"

# ╔═╡ b87d7016-9e6e-411e-8695-b0222bc384f5
begin
	function f(n) #Al analizar la función podemos ver que se divide en números pares e impares, así que f(n) se va a definir como la función.
		if n == 1 #Nos va a indicar la cantidad de saltos permitidos.
			return 1 #En la salida observaremos un "1" que es la cantidad de saltos permitidos.
		elseif n == 2 #Nos va a indicar la cantidad de saltos permitidos.
			return 2 #En la salida observaremos un "2" que es la cantidad de saltos permitidos.
		else #Al usar if-elseif nos ayuda a que evalue condición por condición sin que dependa del resultado anterior para posteriormente cumplir con lo pedido.
			return f(n-1) + f(n-2) #Esta función se va a encargar de detectar el dato n de entrada y diferenciar si es par o impar para llegar al resultado final.
		end
	end
end

# ╔═╡ d84db9ea-83c3-408c-b609-39004da359bf
function num_saltos(n) #Ahora se define el nombre de la función que nos indica los saltos.
	return f(n)

end

# ╔═╡ 9a8cc9d1-53de-41d3-bf82-ab32d8b814bb
md" n debe estar definda en : 1 ≤ n ≤ 45."

# ╔═╡ 2d1163ed-bae8-43f3-b78d-a2fc006a8123
begin
for n in 1:45 #La condición solo se debe cumplir cuando 1≤n≤45.
	saltos = num_saltos(n) #Se define una nueva función que nos indique el valor N.
	println("Distintos valores para n = $n es $saltos") #Se pide que se muestren los posibles resultados de N para los valores 1≤n≤45.
end
end

# ╔═╡ c34a85c0-ecab-42d7-a07b-91bb6c9d9c2a
md"3. Reflexionar sobre la complejidad temporal y espacial del algoritmo:"

# ╔═╡ 0d4e7017-0446-4b02-8816-9fe170454e8d
md"Tenemos que la complejidad del código va a estar relacionada con la cantidad de de datos de entrada y recursos que cuente la programación para poder arrojar un valor de salida en una menor cantidad de tiempo, al usar un ancho de banda de 1≤n≤45 nos ayuda a que no ocupe una gran cantidad de memoría, sin embrago, al aumentar el valor máximo, el código deja de funcionar de forma rápida por la cantidad de datos que se necesitan procesar y, a la vez, ocupa más y más memoría de la computadora."

# ╔═╡ cab7f81d-4027-471b-957c-d2070de2974f
md"4. Reflexionar sobre el valor máximo de n sin general sobreflujo"

# ╔═╡ f4d4df8d-c579-42e4-9e50-6fa77319ad84
md"El sobreflujo se suele generar debido a que hay un exceso de datos de entrada o bits que no pueden ser procesados. El código utilizado no permite un ancho de banda mayor a los 100 datos máximos (que sería un poco mas del doble) ya que el programa empezaría a fallar o a ser muy lento, así que rcomendaría 1≤n≤100."

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

# ╔═╡ dbf1d8ca-2acf-4a6d-b9da-ea2ed9af3bec


# ╔═╡ d6436310-5fab-4a8f-a206-1c9f7db47364


# ╔═╡ Cell order:
# ╟─2c7c0cc4-a1e1-4650-ad23-0a0bd18afe71
# ╟─c3ca5555-664f-4c99-9a58-d179052fd213
# ╟─7d21a98f-306c-405c-9139-25d406644529
# ╟─a11dbe66-f2dd-484b-a75b-79738f21c29e
# ╟─62de0547-dd1d-4e0c-9d81-c900d8a92b21
# ╠═b87d7016-9e6e-411e-8695-b0222bc384f5
# ╠═d84db9ea-83c3-408c-b609-39004da359bf
# ╟─9a8cc9d1-53de-41d3-bf82-ab32d8b814bb
# ╠═2d1163ed-bae8-43f3-b78d-a2fc006a8123
# ╟─c34a85c0-ecab-42d7-a07b-91bb6c9d9c2a
# ╟─0d4e7017-0446-4b02-8816-9fe170454e8d
# ╟─cab7f81d-4027-471b-957c-d2070de2974f
# ╟─f4d4df8d-c579-42e4-9e50-6fa77319ad84
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
# ╠═dbf1d8ca-2acf-4a6d-b9da-ea2ed9af3bec
# ╠═d6436310-5fab-4a8f-a206-1c9f7db47364
