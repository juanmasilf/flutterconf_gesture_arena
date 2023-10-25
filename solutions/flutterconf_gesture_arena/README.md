# Cómo ser un gladiador en el Gesture Arenas

En este repositorio se encuentran los ejercicios para el workshop **Cómo ser un gladiador en el Gesture Arena** de **FlutterConf Latam 2023**, dictado por Juan Manuel Silveira y Matías Leyba.

En estos ejercicios pondremos a prueba los conceptos y reglas aprendidas en la charla, profundizando en los conceptos vistos a un nivel más bajo, creando gestos personalizados y resolviendo conflictos comunes entre gestos que utilizamos normalmente.

## Ejercicio 1 - Triple tap

Se desea implementar un recognizer donde el usuario deba tocar la pantalla tres veces seguidas para ejecutar la lógica asignada al mismo. El tiempo que puede haber entre las interacciones del usuario no puede ser mayor a 300 milisegundos. No se espera agregar la lógica necesaria para que el GestureRecognizer pueda coexistir con otros GestureRecognizers.

La implementación de este GestureRecognizer deberá hacerse en la clase `TripleTapGestureRecognizer` del archivo `lib/exercise_1/triple_gesture_detector.dart`.

## Ejercicio 2 - Single and Double tap conflict

Como vimos en la charla, al tener un TapGestureRecognizer y un DoubleTapGestureRecognizer en el mismo GestureDetector, el DoubleTapGestureRecognizer pausa la decisión de la arena durante 300 milisegundos para esperar el segundo toque; en caso de que no llegue el TapGestureRecognizer, se declara vencedor. Esto hace que si el usuario realiza una sola interacción con el dispositivo, tenga que esperar necesariamente 300 milisegundos para ver la lógica asignada al TapGestureRecognizer, lo que resulta en una mala experiencia de usuario. Para solucionar esto, se pide que se cree un TapGestureRecognizer que reduzca este tiempo de respuesta a 150 milisegundos, haciendo que la decisión del gesto sea más rápida y el usuario vea el efecto en un tiempo más corto.

La implementación de este GestureRecognizer deberá hacerse en la clase `ResponsiveTapGestureRecognizer` del archivo `lib/exercise_2/responsive_tap_gesture_detector.dart`.

## Ejercicio 3 - Double tap and hold gesture

Se desea implementar un recognizer donde el usuario deba tocar la pantalla dos veces seguidas y luego mantener presionada la pantalla durante al menos 200 milisegundos para ejecutar la lógica asignada al mismo. El tiempo que puede haber entre las interacciones del usuario no puede ser mayor a 300 milisegundos. No se espera agregar la lógica necesaria para que el GestureRecognizer pueda coexistir con otros GestureRecognizers.

La implementación de este GestureRecognizer deberá hacerse en la clase `DoubleTapAndHoldGestureRecognizer` del archivo `lib/exercise_3/double_tap_and_hold_gesture_detector.dart`.

## Ejercicio 4 - Triple and single tap conflict

Se desea actualizar la implementación del GestureRecognizer del ejercicio 1 para que pueda coexistir en la arena con un TapGestureRecognizer. Esto significa que el TapGestureRecognizer solo debe ganar si no se cumplen las condiciones del TripleTapGestureRecognizer en la arena.

Para poder realizar la implementación, se deben utilizar los siguientes métodos:

- `GestureBinding.instance.gestureArena.add()`: Este método sirve para agregar el GestureRecognizer a la arena con el puntero especificado.
- `GestureBinding.instance.gestureArena.hold()`: Previene que se resuelva la arena por la Regla 1 (el recognizer se puede declarar victorioso si es el único en la arena).
- `gestureArenaEntryObject.resolve()`: Nos permite resolver la arena. El GestureRecognizer que llama a este método declara la victoria o la derrota dependiendo del parámetro que se le pase.

La implementación de este GestureRecognizer deberá hacerse en la clase `TripleTapGestureRecognizer` del archivo `lib/exercise_4/triple_tap_conflict_gesture_detector.dart`.