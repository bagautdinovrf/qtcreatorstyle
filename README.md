# qtcreatorstyle

Цветовые схемы редактора Qt Creator:

- `paper-light.xml` — **Paper Light** (вариант 7): спокойный бумажный фон и сдержанные акценты.
- `linen-light.xml` — **Linen Light** (вариант 3): тёплый льняной фон и более выразительные оттенки.
- `porcelain-light.xml` — **Porcelain Light**, современная светлая схема: фарфоровый фон, графитовый текст, мягкие синие акценты, приглушённые зелёные строки и сливовые ключевые слова.
- `creator-dark_copy.xml` — **MyDark**.
- `inkpot_copy.xml` — **MyInk**.

## Установка

В Windows скопируйте XML-файл в `%APPDATA%\QtProject\qtcreator\styles`.
Для Paper Light и Linen Light выполните из корня репозитория в PowerShell:

```powershell
$styles = Join-Path $env:APPDATA 'QtProject\qtcreator\styles'
New-Item -ItemType Directory -Force -Path $styles | Out-Null
Copy-Item .\paper-light.xml, .\linen-light.xml -Destination $styles
```

В Qt Creator выберите **Preferences → Text Editor → Font & Colors → Color scheme → Paper Light** или **Linen Light**.
Если приложение было открыто во время копирования, перезапустите его или импортируйте XML через кнопку **Import** на той же странице.
На других ОС также можно воспользоваться импортом. [Документация Qt Creator](https://doc.qt.io/qtcreator/creator-how-to-change-editor-colors.html).

## Светлые схемы

Схема оформляет C++, QML/JavaScript, результаты поиска, диагностику и просмотр различий.
Текущая строка выделяется мягким фоном; выделение текста остаётся контрастным.
Paper Light и Linen Light используют разные оттенки для встроенных типов, классов, значений перечислений, концептов C++, функций, строк, чисел, полей, параметров и глобальных имён. Цвета основных категорий совпадают с выбранными прототипами; минимальный контраст на обычной и текущей строке составляет 4,8:1 для Paper и 4,9:1 для Linen.

Имена полей, параметров и значений enum различаются при работающей семантической подсветке C++. Встроенные типы `int`, `double`, `bool` принадлежат одной категории `PrimitiveType`; отдельные цвета каждому из них XML-схема не задаёт. Исторический ключ `Static` оформляет значения перечислений, а `StaticMember` — статические поля.

Шрифт задаётся отдельно в настройках Qt Creator. Подойдут уже установленные SF Mono или Cascadia Code.
Для согласованного светлого интерфейса можно выбрать **Light (2024)** в **Preferences → Environment → Interface → Theme**.

## Вкладки файлов

`editor-tabs-light.qss` оформляет вкладки открытых файлов в Qt Creator 18 и новее:
ровные отступы, мягкий светлый фон, тонкие разделители и синяя линия толщиной 2 px
под активной вкладкой. Высота вкладок при переключении не меняется.
Стиль подходит к Paper Light, Linen Light и Porcelain Light.

Включите **Preferences → Environment → Interface → Use tabbed editors**.
Для привычного запуска добавьте к полю **Объект** существующего ярлыка Qt Creator
аргумент `-stylesheet "D:\GitHub\qtcreatorstyle\editor-tabs-light.qss"`.
Если используете закреплённый значок на панели задач, настройте и его ярлык.
Отдельный ярлык для этого не требуется. Перед изменением сохраните копию ярлыка.

Qt Creator не сохраняет QSS в своих настройках: аргумент должен присутствовать
при каждом запуске. Полностью закройте приложение после изменения ярлыка;
повторный запуск в уже открытый экземпляр не применит новый стиль.
Прямой запуск `qtcreator.exe` без параметра использует штатное оформление.
Чтобы вернуть штатный вид в ярлыке, удалите из него аргумент `-stylesheet` с путём.

Также можно запускать Qt Creator из корня репозитория:

```powershell
.\start-qtcreator.ps1
```

Если Qt Creator установлен в другом месте:

```powershell
.\start-qtcreator.ps1 -QtCreatorPath 'D:\Qt\Tools\QtCreator\bin\qtcreator.exe'
```

XML-схемы управляют цветами текста редактора, а QSS — вкладками интерфейса.
Правила ограничены файловыми вкладками; кнопки закрытия и закрепления и цвета
названий файлов, показывающие состояние в системе контроля версий, остаются штатными.
Подробнее: [вкладки редактора](https://doc.qt.io/qtcreator/creator-coding-navigating.html#using-tabbed-editors)
и [параметры запуска Qt Creator](https://doc.qt.io/qtcreator/creator-cli.html).
