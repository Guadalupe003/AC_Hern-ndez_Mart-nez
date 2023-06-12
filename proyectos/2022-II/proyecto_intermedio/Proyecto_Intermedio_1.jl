### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 2c7c0cc4-a1e1-4650-ad23-0a0bd18afe71
md"ALGORITMOS COMPUTACIONALES
							
						
									PROYECTO INTERMEDIO

						
Nombre de las estudiantes:
						
Guadalupe del Rocío Hernandez
						
Paz Flores Arantza Pamela"

# ╔═╡ c3ca5555-664f-4c99-9a58-d179052fd213
md"# RANA SALTARINA"

# ╔═╡ 7d21a98f-306c-405c-9139-25d406644529
md"Este ejercicio nos pide encontar todas las maneras posibles en la cuál una rana puede saltar una cantidad n de rocas de un lado del río hacia el otro; las condiciones iniciales son que la rana empieza del lado izquierdo del río, la rana solo puede dar saltos de 1 o 2 rocas a la vez y no puede regresar, también nos piden que los valores esten definidos para 1≤n≤45 y el código debe dar todas las soluciones posibles N."

# ╔═╡ a11dbe66-f2dd-484b-a75b-79738f21c29e
md"1. Para la primera parte del ejercicio se creó un diagrama de flujo que describe el comportamiento del código de la rana, para poder ver el diagrama se debe acceder al siguiente link:"

# ╔═╡ 62de0547-dd1d-4e0c-9d81-c900d8a92b21
md"https://www.canva.com/design/DAFhDeigQIk/KJWabCMfI0ah8NJZhoyK3Q/edit?utm_content=DAFhDeigQIk&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton"

# ╔═╡ 3cdbbf3d-8f04-4b81-b5b6-bc8e3204dbf8
html"""<font color='orange'>Como en el caso extremo <code>n=1</code> tenemos que el "lado izquerdo" y el "lado derecho" del río son lo mismo, sugeriría cambiar el punto de partida a "Revisar que la rana no esté del lado derecho", para que así incluya todos los casos. En general, al programar es <b>importantísimo</b> pensar en este tipo de casos "extremos" o "degenerados" (en cuanto a que son muy poco probables de suceder al azar, pero aún así puede que sucedan) y tenerlos en cuenta, porque es extremadamente común que sean pasados por alto y generen errores. Fuera de eso, la parte de "Probar el código de forma que..." es muy ambigua, pues se supone que tanto el diagrama de flujo como el pseudocódigo sirven para describir cómo sería ese código. ¡Hicieron un diagrama muy lindo! <b>(2.75/3 puntos)</b> </font>"""

# ╔═╡ 4f5ce3b7-3d2b-40bb-815d-062d145ed0a4
md"2. Implementa este algoritmo en Julia. La idea es que tu programa reciba un entero n (el tama˜no
del río), y devuelva N, el número de formas distintas que la rana puede cruzar **(5 puntos)**. Tu programa será aceptado si devuelve el valor correcto de N para cada valor de n, con
1 ≤ n ≤ 45."

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

# ╔═╡ 187e6ebd-4756-4dac-87be-a5e54eded66c
html"<font color='orange'>La celda anterior es equivalente a simplemente haber escrito <code>num_saltos = f</code> (piensen por qué). Más simple aún, pudieron simplemente haber definido a la función <code>f</code> con el nombre <code>num_saltos</code>...</font>"

# ╔═╡ 9a8cc9d1-53de-41d3-bf82-ab32d8b814bb
md" n debe estar definda en : 1 ≤ n ≤ 45."

# ╔═╡ 2d1163ed-bae8-43f3-b78d-a2fc006a8123
begin
for n in 1:45 #La condición solo se debe cumplir cuando 1≤n≤45.
	saltos = num_saltos(n) #Se define una nueva función que nos indique el valor N.
	println("Distintos valores para n = $n es $saltos") #Se pide que se muestren los posibles resultados de N para los valores 1≤n≤45.
end
end

# ╔═╡ b2123c24-a7d0-4875-89ec-20b03267da5f
html"""<font color='orange'>¡Excelente! Sobre todo me gustó lo bien comentado que está su código, aunque un par de comentarios están de más. Otra observación es que así como la función <code>println</code> puede tomar números como argumentos, también puede tomar expresiones que se reduzcan a números. Así, podrían poner algo como <code>println("Distintos valores para n = $n es ", num_saltos(n))</code> y se ahorrarían el uso de memoria necesario para definir a la variable <code>saltos</code>. <b>(5.25/5 puntos)</b></font>"""

# ╔═╡ c34a85c0-ecab-42d7-a07b-91bb6c9d9c2a
md"3. Reflexionar sobre la complejidad temporal y espacial del algoritmo:"

# ╔═╡ 0d4e7017-0446-4b02-8816-9fe170454e8d
md"Tenemos que la complejidad del código va a estar relacionada con la cantidad de de datos de entrada y recursos que cuente la programación para poder arrojar un valor de salida en una menor cantidad de tiempo, al usar un ancho de banda de 1≤n≤45 nos ayuda a que no ocupe una gran cantidad de memoría, sin embrago, al aumentar el valor máximo, el código deja de funcionar de forma rápida por la cantidad de datos que se necesitan procesar y, a la vez, ocupa más y más memoría de la computadora."

# ╔═╡ 03411199-504a-43c6-ad70-466921740388
html"<font color='orange'>Bien. <b>(1/1 punto)</b></font>"

# ╔═╡ cab7f81d-4027-471b-957c-d2070de2974f
md"4. Reflexionar sobre el valor máximo de n sin general sobreflujo"

# ╔═╡ f4d4df8d-c579-42e4-9e50-6fa77319ad84
md"El sobreflujo se suele generar debido a que hay un exceso de datos de entrada o bits que no pueden ser procesados. El código utilizado no permite un ancho de banda mayor a los 100 datos máximos (que sería un poco mas del doble) ya que el programa empezaría a fallar o a ser muy lento, así que recomendaría 1≤n≤100."

# ╔═╡ fc74f26b-688d-4c73-9d2f-58bc00d25a7e
html"""<font color='orange'>¿Cómo justifican que "El código utilizado no permite un ancho de banda mayor a los 100 datos máximos"? No lo veo. <b>(0.25/1 punto)</b></font>"""

# ╔═╡ 1032152a-4644-4ef5-bd16-c9ba083ccb42
md"# TORRES DE HANOI"

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
Y justo es esta sucesión: 1,2,7,15 que se puede escribir como: 2^n-1."

# ╔═╡ fd489eb8-b6c0-4e84-9261-5807d7b2f789
html"""<font color='orange'>Su respuesta fue muy buena. Sin embargo, al ser su solución recursiva, su diagrama de flujo debió de haber reflejado esto. <b>(3.75/4 puntos)</b></font>"""

# ╔═╡ 1a5284fd-8642-4c29-ac35-75c840d9782b
md"2. Implementa el algoritmo en Julia. Tu programa será aceptado si devuelve las respuestas correctas para cada n, con 1 ≤ n ≤ 16. (6 puntos)"

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
html"<font color='orange'>Muy bien. <b>(6/6 puntos)</b>"

# ╔═╡ b5140383-7dab-46fc-aa9a-962fb44671fa
html"<font color='orange'>Calificación del proyecto intermedio: (2.75+5.25+1+0.25+3.75+6)/2 = <b>9.5</b>.</font>"

# ╔═╡ 6c24421d-c4d0-407f-b886-f679512987ac
html"<font color='orange'>Nota: Gracias por hacer todo en un solo <i>notebook</i>.</font>"

# ╔═╡ Cell order:
# ╟─2c7c0cc4-a1e1-4650-ad23-0a0bd18afe71
# ╟─c3ca5555-664f-4c99-9a58-d179052fd213
# ╟─7d21a98f-306c-405c-9139-25d406644529
# ╟─a11dbe66-f2dd-484b-a75b-79738f21c29e
# ╟─62de0547-dd1d-4e0c-9d81-c900d8a92b21
# ╟─3cdbbf3d-8f04-4b81-b5b6-bc8e3204dbf8
# ╟─4f5ce3b7-3d2b-40bb-815d-062d145ed0a4
# ╠═b87d7016-9e6e-411e-8695-b0222bc384f5
# ╠═d84db9ea-83c3-408c-b609-39004da359bf
# ╟─187e6ebd-4756-4dac-87be-a5e54eded66c
# ╟─9a8cc9d1-53de-41d3-bf82-ab32d8b814bb
# ╠═2d1163ed-bae8-43f3-b78d-a2fc006a8123
# ╟─b2123c24-a7d0-4875-89ec-20b03267da5f
# ╟─c34a85c0-ecab-42d7-a07b-91bb6c9d9c2a
# ╟─0d4e7017-0446-4b02-8816-9fe170454e8d
# ╟─03411199-504a-43c6-ad70-466921740388
# ╟─cab7f81d-4027-471b-957c-d2070de2974f
# ╟─f4d4df8d-c579-42e4-9e50-6fa77319ad84
# ╟─fc74f26b-688d-4c73-9d2f-58bc00d25a7e
# ╟─1032152a-4644-4ef5-bd16-c9ba083ccb42
# ╟─6f3e8859-6408-47e3-93a1-d8b64bb4db27
# ╟─6bc87d1d-cfa0-464f-a1d3-e6d6fee972b7
# ╟─8a874bc6-8e13-4bdd-983e-62c0459ebc6a
# ╟─5f96beea-2772-467a-8be0-1be21e0440c8
# ╟─257951d6-affb-4cfc-ab65-49b0f34a3c61
# ╟─5c3525a3-a673-44cd-9456-5527773e86a7
# ╟─4c72f972-95b0-43a1-b34d-129e1281a57e
# ╟─6986b185-bbef-4cc4-913b-d7e374c62752
# ╟─fd489eb8-b6c0-4e84-9261-5807d7b2f789
# ╟─1a5284fd-8642-4c29-ac35-75c840d9782b
# ╠═d404038a-59de-480f-9955-d7334cc55243
# ╠═fe8da3ba-fef0-48d3-bff1-b7437d51baba
# ╟─dbf1d8ca-2acf-4a6d-b9da-ea2ed9af3bec
# ╟─b5140383-7dab-46fc-aa9a-962fb44671fa
# ╟─6c24421d-c4d0-407f-b886-f679512987ac
