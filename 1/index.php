<?php
	if($_POST) {//если кнопка была нажата
		if (strlen($_POST['base']) > 247) {//обрезка под 250 символов, если полученный текст больше
			$preview = substr($_POST['base'], 0, 247);
		}
		else {
			if (strlen($_POST['base']) < 1) { //если статьи нет, то не на что делать ссылку 
				return;
			}
			$preview = $_POST['base']; //если полученная статья каким-то образом меньше 247 символов, то обрезать не нужно
		}
		
		$ch = $preview[-1]; //текущий взятый символ
		$offset = 0; //отступ, указатель, через который делается проход по тексту
		$last = 0; //символ, до которого распространяется ссылка
		$first = 0; // символ, с которого начинается ссылка
		$spaces_count = 0; //счётчик пробелов (для отсчёта трёх слов для гиперссылки)

		while ($offset < strlen($preview)-1) { //проход по тексту с его конца
			if ($ch == ' ') {
				$spaces_count++;
				if ($spaces_count == 1) { 
					$last = $offset + 1;
				}
				if ($spaces_count == 4) { //на четвёртом пробеле в диапазоне от $first до $last окажутся ровно 3 слова
					$first = $offset;
					break;
				}
			}
			$offset++;
			$ch = $preview[-1 - (int)$offset];//взятие следующего символа
		}
		if ($first == 0) {
			$first = $offset;
		}				
		//print(substr($preview, 0, strlen($preview) - $first));//вывод части без ссылки
		//print(substr($preview, strlen($preview)-$first, $first-$last)."...");//три слова, которые должны быть с ссылкой + многоточие
	}
?>

<!DOCTYPE html>
<html lang="ru">
	<body>
		<form method="post">
			<textarea id="base" name="base"></textarea>				
			<label id="preview" name="preview" readonly="true">
			<?php if ($_POST) {
				print(substr($preview, 0, strlen($preview) - $first));//вывод части без ссылки
			}
			?><a href="localhost/article.php">
			<?php if ($_POST) {
				print(substr($preview, strlen($preview)-$first, $first-$last)."...");//вывод части без ссылки
			}
			?>
			</a></label>				
			<p>
				<button type="submit">Cut</button>
			</p>
		</form>
		
	</body>
</html>