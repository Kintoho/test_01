﻿Функционал: Подготовить тест для задания "В конфигурацию добавили отчет для вывода остатков товаров (отчет Остатки)"

Как нетопырь-веган я хочу
проверить отчет Остатки
чтобы убедиться в корректности данных 

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Проверка отчета "Остатки товаров"
* Формирование отчета (первичное)
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И Пауза 1
* Сравнение данных первичного отчета с макетом
	И табличный документ "Результат" содержит строки из макета "Standart" по шаблону	
* Настройка макета отчета (вывод пометки на удаление для товара)
	И я нажимаю кнопку выбора у поля с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение'
	Тогда открылось окно "Редактирование выбранных полей"
	И в таблице 'SelectionAvailableFields' я разворачиваю строку:
		| "Доступные поля" |
		| "Товар"          |
	И в таблице 'SelectionAvailableFields' я перехожу к строке:
		| "Доступные поля"   |
		| "Пометка удаления" |
	И в таблице 'SelectionAvailableFields' я выбираю текущую строку
	И я нажимаю на кнопку с именем 'OK'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
* Пометка на удаление документа с продажей и товара
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=a9b200055d49b45e11db9744d21cfa17"
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И Я закрываю окно "Bosch1234 (Товар)"
			
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbf30050ba5c887711e1fe6190994fdc"
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И Я закрываю окно "Продажа * от *"

*Контроль изменений данных в отчете
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И табличный документ "Результат" содержит строки из макета "izmenenie" по шаблону	

* снятие пометки на удаление
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=a9b200055d49b45e11db9744d21cfa17"
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbf30050ba5c887711e1fe6190994fdc"
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И Я закрываю окно "Продажа * от *"

* Возврат к стандартным настройкам
	И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройки'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И табличный документ "Результат" содержит строки из макета "Standart" по шаблону	
И я закрываю все окна клиентского приложения

