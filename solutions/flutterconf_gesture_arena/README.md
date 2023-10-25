# Como ser un gladiador en el Gesture Arenas

En este repositorio se encuentran los ejericios para el workshop **Como ser un gladiador en el Gesture Arena** de **FlutterConf Latam 2023**. Dictado por Juan Manuel Silveira y Matias Leyba.

En estos ejercicios pondremos a prueba los conceptos y reglas aprendidas en la charla, profundizando en en los conceptos vistos a mas bajo nivel, creando gestos personalizados y resolviendo conflictos comunes entre gestos que utilizamos normalmente.

## Ejercicio 1 - Triple tap

Se desea implementar un recognizer donde el usuario deba apretar 3 veces seguidas la pantalla para ejecutar la logica asignada al mismo. El tiempo que puede haber entre las interacciones del usuario, no puede ser mayor a 300 milisegundos. No se espera agregar la logica necesaria para que el GestureRecognizer pueda coexistir con mas GestureRecognizers.

La implementacion de este GestureRecognizers debera hacerse en la clase `TripleTapGestureRecognizer` del archivo `lib/exercise_1/triple_gesture_detector.dart`.

## Ejercicio 2 - Single and Double tap conflict

Como vimos en la charla, al tener un TapGestureRecognizer y un DoubleTapGestureRecognizer en el mismo GestureDetector, el DoubleTapGestureRecognizer pausa la decision de la arena por 300 milisegundos para esperar el segundo tap, en caso que no llega el TapGestureRecognizer se declara vencedor. Esto hace que si el usuario realiza una sola interaccion con el dispositivo, tenga que esperar si o si 300 milisegundo para ver la logica asignada al TapGestureRecognizer, resultado en una mala experiencia de usuario. Para solucionar esto se pide que se cree un TapGestureRecognizer que baje este tiempo de respuesta a 150 milisegundos haciendo que la decision del gesto sea mas rapida y el usuario vea el efecto en un mejor tiempo.

La implementacion de este GestureRecognizers debera hacerse en la clase `ResponsiveTapGestureRecognizer` del archivo `lib/exercise_2/responsive_tap_gesture_detector.dart`.

## Ejercicio 2 - Double tap and hold gesture

Se desea implementar un recognizer donde el usuario deba apretar 2 veces seguidas y luego mantener apretada la pantalla por lo menos 200 milisegundos para ejecutar la logica asignada al mismo. El tiempo que puede haber entre las interacciones del usuario, no puede ser mayor a 300 milisegundos. No se espera agregar la logica necesaria para que el GestureRecognizer pueda coexistir con mas GestureRecognizers.

La implementacion de este GestureRecognizers debera hacerse en la clase `DoubleTapAndHoldGestureRecognizer` del archivo `lib/exercise_3/double_tap_and_hold_gesture_detector.dart`.

## Ejercicio 4 - Triple and single tap conflict

Se desea actualizar la implementacion del GestureRecognizer del ejercicio 1, para que pueda coexistir en la arena con un TapGestureRecognizer. Esto quiere decir que el TapGestureRecognizer debe ganar solamente si no se cumplieron las condiciones del TripleTapGestureRecognizer en la arena.

Para poder realizar la implementacion se debe utilizar los siguientes metodos: 

 - `GestureBinding.instance.gestureArena.add()`: A este metodo sirve para agregar el GestureRecognizer a la arena con el pointer especificado.
 - `GestureBinding.instance.gestureArena.hold()`: Previene que se resulva la arena por la Regla 1 (El recognizer se puede declarar victorioso si es el unico en la arena)
 - `gestureArenaEntryObject.resolve()`: Nos permite resolver la arena. El GestureRecognizer que llama a este metodo declara la victoria o la derrota dependiendo del parametro que se le pase.

La implementacion de este GestureRecognizers debera hacerse en la clase `TripleTapGestureRecognizer` del archivo `lib/exercise_4/triple_tap_conflict_gesture_detector.dart`.
