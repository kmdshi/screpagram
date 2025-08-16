<p align="center">
  <img width="800" height="400" alt="screpagit" src="https://github.com/user-attachments/assets/0aaa70a5-e6de-45a3-969f-6fc5c2557b38" />
</p>

<p align="center">
  <a href="https://www.youtube.com/watch?v=WHDAuqcva3c">
    <img src="https://img.shields.io/badge/YouTube-Subscribe-red?logo=youtube&logoColor=white" alt="YouTube" />
  </a>
  <img src="https://img.shields.io/badge/Made%20with-Flutter-blue" alt="Flutter" />
</p>


# Screpagram

**Screpagram** — сатирическая антиутопическая социальная сеть, где ценится не свобода слова, а благонадёжность, а каждый пост и комментарий анализируется ИИ.  

Фронтенд реализован на **Flutter**, а бекенд на **FastAPI** с интеграцией ИИ-модулей для анализа контента.

---

## Особенности

- **Система благонадёжности (Trust Score™)**  
  Рейтинг пользователя зависит от каждого действия: публикации, комментарии, лайки. Плохие действия снижают Trust Score.  

- **ИИ-модерация контента**  
  Все посты проверяются искусственным интеллектом. Слишком дерзкий комментарий? ИИ решает, что делать.  

- **Личный куратор**  
  Виртуальный куратор «наблюдает» за пользователем и даёт советы по поведению и публикациям.  

- **Мемы и посты**  
  Публикуйте контент, но помните — ИИ знает, что вы на самом деле думаете.  

---

## Технологии

- **Frontend:** Flutter  
- **Backend:** FastAPI + Python + ИИ-модули  

---

## Установка и запуск

1. Клонируйте репозиторий:  
```bash
git clone https://github.com/yourusername/screpagram.git
cd screpagram
```
2. Создайте виртуальное окружение и установите зависимости:
```bash
python -m venv venv
source venv/bin/activate  # Linux / macOS
venv\Scripts\activate     # Windows
pip install -r requirements.txt
```
3. Настройте переменные окружения для базы данных и ИИ-модулей.
4. Запустите бекенд FastAPI:
```bash
uvicorn app.main:app --reload
```
5. Запустите фронтенд Flutter:
```bash
flutter pub get
flutter run
```
## Лицензия
Under MIT License, также
Проект  является учебным и сатирическим экспериментом. Использование — на ваш страх и риск.
