Windows (WSL2)
1.Открой PowerShell от имени администратора.
2.Выполни:
wsl --install
3.Перезагрузи ПК (если попросит).
4.Открой Ubuntu (из меню Пуск), создай пользователя.
5.Проверь:
wsl -l -v (должно быть WSL2) (Microsoft Learn)
macOS
1.Открой Terminal.
2.Проверь Git:
git --version
Если Git не установлен — macOS предложит поставить Command Line Tools. (git-scm.com)
Linux (Ubuntu/Debian-подобные)
Открой Terminal.
Установка Git (если нет):
sudo apt update && sudo apt install -y git
