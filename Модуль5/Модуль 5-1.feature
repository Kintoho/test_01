﻿#language: ru

@tree

Функционал: Выполнение ПЗ: В тесте с помощью цикла необходимо создать 10 элементов справочника Номенклатура с разными наименованиями без дополнительных реквизитов 

Как безумный поваренок я хочу
наполнить справочник Номенклатура с позициями вчерашней готовки 
чтобы создать перечень меню для тез, кто не особо следит за качеством питания 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Заполнение справочника Номенклатура однотипными данными с разным наименованием
	И я закрываю все окна клиентского приложения	
* Переход в справочник Номенклатура
	Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
* Создание цикла заполнения
	И Я запоминаю значение выражения '0' в переменную "Шаг"
	И я делаю 10 раз
		И я запоминаю значение выражения "$Шаг$ + 1" в переменную "Шаг"
		И я запоминаю значение выражения '"Макарошки с котлеткой порция "+ $Шаг$' в переменную "НаименованиеНоменклатуры"
		И я нажимаю на кнопку с именем 'FormCreate'
		И в поле с именем 'Description_en' я ввожу текст '$НаименованиеНоменклатуры$'
		И в поле с именем 'ItemID' я ввожу текст "80085"
		И я нажимаю кнопку выбора у поля с именем 'ItemType'
		Тогда открылось окно "Виды номенклатуры"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Товар (без характеристик)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Номенклатура (создание) *'
		И я нажимаю кнопку выбора у поля с именем 'Unit'
		Тогда открылось окно "Единицы измерения"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'шт' |
		И в таблице 'List' я выбираю текущую строку		
		Тогда открылось окно "Номенклатура (создание) *"
		Когда открылось окно 'Номенклатура (создание) *'
		И я нажимаю кнопку выбора у поля с именем 'Vendor'
		Тогда открылось окно "Партнеры"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '3'   | 'Поставщик 1 (1 соглашение)' |
		И в таблице 'List' я выбираю текущую строку
		* Запись изменений формы
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Номенклатура (создание) *" в течение 20 секунд			
	* Переход к новому циклу
	И я закрываю все окна клиентского приложения	



