﻿#language: ru

@tree

Функционал: Проверка заполнениея полей документа Заказ покупателя

Как Нечто, что не вечно я хочу
Выполнить задание: Протестируйте заполнение следующих полей документа Заказ покупателя: Партнер, Соглашение, 
блокировку поля Контрагент – в случае, если не выбран Партнер

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнениея полей документа Заказ покупателя: Партнер, соглашение
	И я закрываю все окна клиентского приложения	
	* Начало регистрации документа Заказы покупателей		
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Когда открылось окно 'Заказ покупателя (создание)'
	* Заполнение реквизитного блока документа
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
			| 'Обычное' | 'По соглашениям'     | '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormWrite'												
	* Проверка заполненности реквизитного блока
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 1 (расчет по соглашениям)'
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		И я жду закрытия окна 'Заказ покупателя * от *' в течение 20 секунд
		Когда открылось окно 'Заказы покупателей'
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя * от *'
		И я нажимаю на гиперссылку с именем "DecorationGroupTitleCollapsedPicture"
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 1 (расчет по соглашениям)'
	И я закрываю все окна клиентского приложения	

Сценарий: Проверка условия задачи: блокировка поля Контрагент – в случае, если не выбран Партнер
	* Начало регистрации документа Заказы покупателей		
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Когда открылось окно 'Заказ покупателя (создание)'
	* Проверка блокировки реквизита Контрагент
		Если элемент формы с именем "Partner" стал равен ''
		И элемент формы с именем "LegalName" не доступен
	* Заполнение реквизитного блока документа и проверка доступности реквизита		
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '10'   | 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Partner" стал равен 'Розничный покупатель'
		И элемент формы с именем "LegalName" доступен
		И я закрываю все окна клиентского приложения