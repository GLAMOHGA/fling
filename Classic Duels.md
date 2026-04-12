--[[
⠁⠀⠂⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠂⠀⠁⡀⠐⠈⠀⠐⠈⠀⠐⠀⠐⠀⡀⠂⠀⠐⠀⠠⠐⠀⠀⠄⠀⠠⠀⠀⠄⠀⠀⠄⠀⠀⢸⡿⠀⠀⠀⠀⠀⡀⠀⢀⠀⠀⡀⠀⢀⠀⠀⡀⠀⢀⠀⠀⡀⠀⠀
⠀⠁⠈⢀⠀⠄⠈⠀⠁⠈⠀⠁⠈⠀⠄⠀⢀⠈⠀⠠⠀⠀⠀⠂⠀⠀⣄⣠⣤⣤⠴⠶⢶⡶⠶⠬⠿⢤⣀⣀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀
⠄⠈⢀⠀⠠⠀⠂⠁⢀⠈⠀⠄⠁⢀⠠⠀⠀⡀⠐⠀⢀⠈⢀⣤⠶⠛⠉⠁⣠⠀⠀⡠⠀⣤⢋⠁⠐⠠⡀⢈⠙⠒⢤⣀⠀⠂⠀⠀⠂⠀⠀⠂⠀⠀⠂⠀⠀⠄⠀⠀
⠐⠀⡀⠠⠀⠠⠐⠀⠀⡀⠂⠀⠠⠀⠀⠠⠀⠀⡀⠄⣠⣴⡿⠋⠀⢀⣴⠞⠁⢀⠜⣠⠞⢡⠃⠀⢠⠀⠑⡄⠑⢄⠀⠈⠓⢤⡀⠀⠀⠀⠄⠀⠀⢀⠀⠀⠀⠀⠀⠀
⡁⠀⠄⠀⠐⠀⡀⠄⠁⠀⡀⠄⠁⠀⠐⠀⡀⠁⣠⣾⡿⠟⠀⠀⣰⡿⠃⠀⠠⢁⡴⠁⢀⡇⢠⠃⢸⠀⠀⢸⡄⠀⢣⠈⠠⡀⠑⢆⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀
⡀⠂⢀⠈⠀⠄⠀⠀⠄⠂⠀⢀⠠⠈⠀⡀⢀⡼⣿⠏⡁⣠⠃⣼⠟⡀⠀⠀⣿⡾⡅⠀⣼⠀⡼⠀⠈⡇⠀⢸⢣⠀⠀⠃⢠⠑⢤⡈⠳⡀⠀⠀⠁⣀⣠⣤⠤⠄⠒⠒
⠄⠀⡀⠀⠂⢀⠈⠀⡀⠄⠂⠀⢀⠠⠀⢠⡿⣽⢫⠖⢰⠃⣸⣏⡞⠀⢀⣾⣿⠇⠀⡄⡇⢸⡇⠀⠀⢳⠀⢸⡼⡄⠀⠀⠀⡇⠀⠱⡀⢳⣀⡴⠛⠉⠀⠀⠀⠀⠀⠀
⠄⠐⠀⠀⠂⠀⠠⠀⢀⠀⠀⠂⠀⠀⣴⡿⣻⠃⡞⢀⠃⢀⣏⡞⠀⠀⣾⣿⣿⣀⢰⠃⣇⠀⢧⠀⡃⠈⣇⢸⣷⡇⠀⠀⠀⢸⠀⠀⢱⣀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠂⠁⢀⠈⠀⠠⠀⠀⠂⠀⢁⣾⣿⣱⠏⢸⠇⠀⡤⢾⣿⠓⠛⢻⣿⠋⣟⠀⣸⠃⣷⠀⠘⢦⡇⠀⠸⣟⣿⡆⠀⠀⠀⠘⡆⠀⠀⣿⣳⣷⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠁⠀⠄⠂⠀⠐⠀⠀⠁⡀⢨⣾⣿⢃⡿⢀⣹⡤⢁⠀⣿⣟⠀⠀⣿⡿⠀⣯⠀⣿⣷⠸⣇⢤⡈⢷⡀⠀⢸⢿⣷⠦⣀⠀⢈⡇⠀⠀⠸⡇⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠐⠈⠀⠀⠐⠀⠈⠀⠄⢠⣿⢣⡏⣼⣏⠀⢿⣷⠀⢢⣿⣯⡀⢸⢿⣇⠀⢹⡆⣿⣿⣤⡻⣦⣿⣦⣽⣶⣾⣈⣻⣤⠈⠙⢺⡇⠰⠀⠀⣷⢸⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠂⠁⠀⢀⣿⠇⣾⡐⣿⣿⠈⢾⣿⡆⣹⣇⣹⣷⣾⣬⣿⡀⠈⣿⣯⢻⣿⣧⠉⢻⡟⣷⡄⢹⠀⢸⡇⠀⠀⣼⡇⠀⠀⠀⢹⠈⡟⣇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠁⠀⠠⠈⢸⡿⢸⣷⡚⣿⣿⡡⢘⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⡄⠈⠎⠢⢽⣿⣷⣄⡇⠈⣿⣿⣄⣀⣿⠀⢠⣿⠃⠀⡀⠀⣽⠀⣷⣿⡄⢠⠀⡄⡀⠆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡧⣿⣿⡔⣿⣿⣇⠄⣿⡇⠈⢧⠈⢿⣿⣾⡶⠋⠁⠀⠀⠀⠀⠙⠙⠻⣷⣾⡿⣿⣿⣿⣿⣤⣿⡿⠠⠀⡄⢠⣿⠀⣿⣽⡇⠢⠑⠈⡜⢦
⠀⠀⠀⠀⠀⠀⠀⠀⠁⠘⣿⣿⣿⢧⣿⣿⣿⣖⡸⣷⠀⠀⠑⠤⠭⠏⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣯⡍⠸⣿⣿⣧⠀⢨⣇⣾⣿⠀⣟⢸⡇⠀⠀⠀⡜⠸
⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠘⣿⣿⡿⣿⣿⣿⣿⢿⣻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠒⢤⠀⠀⠀⠀⠤⣛⣛⣋⠀⠈⢁⣿⠇⡀⣾⣽⢿⡁⢠⡟⣼⡇⠀⢀⠒⡌⠱
⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢨⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⠳⣄⡀⠀⠀⠀⠀⠀⠀⢧⢀⡠⠃⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡟⡰⣰⣿⡟⣾⢠⣾⣧⣿⠀⢀⠌⡓⣌⢣
⠀⠀⠀⠀⣀⣤⡴⠶⢶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠙⢛⣏⣇⣆⣖⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⣰⣿⢿⣟⣵⣿⡟⢧⣿⣿⣿⡿⠃⠀⡌⢎⡱⢌⡖
⠀⢀⣴⠟⠉⣠⣴⣾⣿⣿⣿⠿⠻⢿⣿⣿⣿⣿⠿⢿⣷⡀⣉⢆⣟⠏⠠⣤⠤⠤⠄⣀⣀⠀⠀⠀⠀⠵⣸⢵⣞⣻⣿⣿⣿⣿⣿⣷⣿⣿⡿⠋⠀⣀⠣⡜⢢⡙⢮⡜
⢠⡟⠁⣠⢞⠿⣩⣾⡽⠋⣠⡷⠻⠀⠀⠙⣿⢻⡀⠀⠉⠛⣤⠀⠀⠀⠀⠈⠑⠒⠠⠤⠞⠛⠀⠀⠈⠘⠁⠘⠛⣽⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠰⣀⠳⡌⢧⡹⢣⢞
⢸⢀⡞⡵⠋⣴⡿⢋⠀⣰⠟⠠⢁⠂⠄⠀⢹⡆⢹⡀⠀⠀⠈⢳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠟⣿⣿⣿⣿⣿⣿⣿⡿⢿⡿⣤⣇⣌⠳⣜⣣⠽⣍⢾
⢀⡟⡞⢀⣾⠟⡵⠃⣰⠏⠀⠀⣼⠀⡙⣂⡏⢹⣀⡧⠀⠀⠀⠀⣿⣷⣦⡀⠀⠀⠀⠀⠀⢀⣠⣤⡶⠋⠁⠀⣼⣯⢿⡟⣻⠇⢨⡉⢤⡀⠙⢶⣍⠻⣟⠶⣭⢞⣭⠏
⢸⢹⠁⡼⢥⡾⠁⣰⠏⠀⠀⣰⡟⠀⣇⣼⠁⣸⣸⠇⠈⠀⠤⠀⣿⣿⣿⡿⣷⣤⣴⣶⣿⣿⣿⠿⡇⠀⠀⢠⣿⣣⡟⠡⡿⢠⠀⢿⠀⠘⢳⡈⢿⣳⣌⠳⣬⣻⡎⠀
⠸⣿⣰⠏⣾⠃⢀⡿⠀⠀⢠⡿⠁⢨⡼⠃⢠⣯⠏⠀⠀⠀⠀⠀⣿⣋⢿⣽⣳⢯⣞⣼⡿⠋⠈⠘⡇⠀⠀⣾⢳⣿⠁⣸⡇⢸⠀⢸⢀⠀⠸⣷⡄⢻⡽⡆⢿⠟⢟⠂
⠀⠙⣿⣼⡏⣄⣸⡇⠀⠀⡞⠁⠄⣾⠃⢀⣿⠋⠀⠀⠀⠀⠀⠀⣿⠐⣈⠹⠷⣫⣾⠏⠀⠀⠀⠀⡇⠀⣸⣿⣿⣿⠀⡼⡇⢸⠀⠘⡌⣆⠀⠘⣧⡌⢿⡇⣸⠀⠈⢳
⠀⣼⣯⣿⣸⡇⣿⠀⠀⣸⠇⠀⣼⠁⣀⣾⠃⠀⠀⠀⠀⠀⠀⢀⡯⠰⡏⠁⠀⠜⠁⠀⠀⠀⠀⠀⣇⢠⣏⢿⣿⣿⡀⣇⣧⣾⡀⠀⠀⣿⢠⡀⢹⣷⠘⡷⠃⠀⠀⠀
⣸⠿⣿⡟⣼⡇⣿⠀⠀⣿⣰⢽⡇⠀⢿⡇⠀⠀⠀⠀⢀⣠⢴⣿⠄⠁⢧⠀⠀⠀⠀⠀⣰⠀⠀⠀⢘⡿⢧⣾⣿⣿⣷⣿⠈⣿⣇⠀⠀⣻⢸⡇⠰⣿⣇⢳⠀⠀⠀⠀
⡏⠀⣿⡿⣼⡇⣿⡡⠀⣿⣿⣿⠀⢀⠘⣄⣀⣠⠤⠒⠍⠂⠘⢿⡀⠂⠸⡄⠀⠀⠀⣰⡏⠀⠀⠀⣼⠃⠀⠈⠙⠻⢿⣿⣇⣿⣿⣆⡀⢹⢾⣇⠰⡏⢹⠘⡇⠀⠀⠀
⠀⠀⠘⣿⢲⣷⣿⣽⣇⡿⠟⠋⠉⠉⠀⠀⠒⠶⢬⣝⣒⣦⣄⣸⣇⠀⢀⣃⠀⠀⢠⠋⢁⣀⣀⣠⡿⠤⠞⠒⠒⠃⠀⠀⠀⠈⠄⠁⠉⠉⠛⠻⢌⡇⢸⡀⡇⠀⠀⡰
⠀⠀⠀⠹⣧⣻⣾⠟⠉⠀⠀⠀⠀⠀⠘⢆⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠑⠀⠘⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢾⣱⠇⠀⠈⠀
⠀⠀⠀⠀⢙⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣟⠀⠀⠀⠀
⡀⠀⠀⠀⡾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀
⢧⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⢹⠀⠀⠀
⠀⢳⣀⢸⢁⠀⠀⠀⠀⠀⠀⠀⢨⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠁⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀
⠀⠀⠙⢿⢂⡐⠀⠀⠀⠀⠀⠀⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣻⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀
⠀⠀⠀⢸⡇⡐⠀⠀⠀⠀⠀⢀⣄⣽⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣷⡀⠀⠀⠀⠀⠀⠀⢨⡇⠀⠀
⠀⠀⠀⠘⡷⣈⠐⠀⠀⠀⣠⣑⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⡀⠀⠀⠀⡀⣼⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠷⣄⠀⠀⠀⠀⢸⣇⠀⠀
⠀⠀⠀⠀⣷⡱⢊⠐⣠⡗⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠅⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡄⠀⢸⡀⠢⠀
⠀⠀⢠⡴⢻⣕⢣⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⣉⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣇⣹⠟⢄⠁
⠀⢰⣿⠟⢩⡬⢞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣿⡇⠈⣧
⠀⣿⡃⠀⣜⡎⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⠁⢠⡟
⠀⠹⠷⠦⢹⣗⠀⠀⢀⣴⣺⣻⡶⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⡤⣄⠀⠀⠀⡎⡿⢤⡿⠞
⠀⠀⠀⠀⢀⣿⡂⠀⣯⠿⣏⣯⣟⣜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣟⣿⡧⣿⣿⠀⠀⢀⡯⡇⠀⠀⠀
⠀⠀⠀⠀⢤⡋⣷⡀⠙⠻⣟⣿⠵⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣋⢿⡔⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣿⣯⡿⠀⠀⣸⠁⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⡧⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠙⢯⣟⡶⣆⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⠏⠀⠀⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡷⣬⡥⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⡿⠛⠁⠀⠀⢸⠀⠈⠙⠻⢽⣷⢦⣄⣀⡀⢀⠀⢀⠀⣀⣠⠀⣠⢔⠔⠁⠀⠀⠀⢀⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣿⢰⢻⡕⣘⠓⣿⢯⢿⣟⠾⣳⣛⣾⡿⠟⠋⠁⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠛⠛⠛⠉⠁⣼⠁⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢿⡪⡕⣣⠤⣉⣿⠀⢊⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⠀⠀⠀⣿⠀⠂⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣇⠳⢆⡱⠠⢿⠀⠂⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⡁⠀⠀⠀⠀⠀⢸⡃⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠸⣇⡻⢜⡰⡉⢾⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠠⠐⠀⠀⠀⡀⠌⢸⠄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣷⢩⠖⣡⠇⣹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣄⠩⠄⢂⠁⡰⠈⣼⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢹⡎⢽⢠⢋⠴⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⢿⣆⡘⠤⢂⡱⢈⣾⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⣟⡜⢢⠉⠆⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡐⠠⢉⠻⢶⠡⢆⢃⡿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡘⠤⡉⠆⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠸⣇⠑⣈⠒⠤⢋⠴⣩⡇⠀⠀⠀⢀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⢂⠱⢨⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁⠀⢻⣄⠂⢍⣸⣡⣾⠟⠀⠀⠀⠀⢸
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡟⡦⢑⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠀⠀⠀⠈⢿⡞⣎⡷⠋⠀⠀⠀⠀⠀⠀⣼
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢱⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠈⢻⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡿⡱⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠀⠀⢠⣟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⢥⠃⡌⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡄⠀⠀⠀⠀⠀⢰⣞
⠀⠀⠀⠀⠀⠀⠀⠀⣰⢏⡼⠁⠐⢀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣄⠀⠀⠀⢀⡿⣜
⠀⠀⠀⠀⠀⠀⠀⣼⣫⠞⡀⢡⠂⠀⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⢰⡟⣼
⠀⠀⠀⠀⠀⠀⣼⡷⢋⡐⢈⠄⢂⠁⠄⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⣸⣽⡳
⠀⠀⠀⠀⠀⣼⠟⡡⢂⠔⢂⠈⠄⠂⠌⠠⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡀⣿⡞⣽
⠀⠀⠀⠀⣰⢏⠦⡑⢌⡐⠢⡈⠤⠁⠌⡐⢀⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⣯⢿⡼
⠀⠀⠀⢀⡿⣈⠖⡈⠆⡌⠱⡐⢢⢁⠂⡐⠀⠆⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⢧⣟
⠀⠀⠀⣸⡓⠴⡈⠴⠡⢌⠱⡈⠆⡌⡐⠠⠁⠂⠌⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣟⡾
⠀⠀⢀⡟⡬⢱⠘⡄⢃⠎⡰⢁⠎⡐⠀⠑⣆⠁⢂⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣳
⠀⠀⢸⢏⡔⡃⢎⠰⡁⠎⡐⠂⠄⠠⠀⠀⠈⢶⡀⠂⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠁⠀⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⡵
⠀⠀⣾⢡⠚⣌⠢⡑⠄⡃⠄⠁⡘⠀⠀⠀⠀⠀⠹⣄⠂⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠐⢠⢈⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣻
⠀⠀⣟⡌⢳⠠⣃⠌⠒⡀⠂⠈⠀⠀⠀⠀⠀⠀⠀⠙⣦⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⣀⡾⢀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡷
⠀⠀⡯⡜⣡⠒⡡⠘⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣼⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⢀⢆⡴⠏⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡿
⠀⠈⡷⣑⠢⡱⠡⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢧⠀⠀⠀⠀⡐⣿⡀⠀⠀⠀⢀⣾⠟⡁⠂⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿
⠀⠀⡷⢡⢓⡰⢁⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⢬⣿⡉⠀⠀⢀⣾⠣⡘⠠⢡⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣷
⠀⠀⢽⡡⢆⡱⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣤⣿⣿⣷⣀⣤⣿⠡⠆⡁⢂⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡷
⠀⠀⣾⢰⢃⠦⡉⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡟⠋⠹⠟⢻⡿⣡⠃⠜⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡽
⠀⠀⢽⡎⡜⢢⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡦⠀⠀⣾⡱⡂⠥⠈⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡽
⠀⠀⢸⡧⡙⢆⠣⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠔⢸⢧⡓⣁⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⢻
⠀⠀⠸⣗⠭⣊⠕⡨⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⠀⣿⢎⡱⠠⢈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣯⣟
⠀⠀⠀⣿⡜⢢⢍⠰⡁⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⡁⣯⢛⠴⡁⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣳⢾
⠀⠀⠀⢹⣎⠇⣎⠒⡄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⡇⣏⢎⡒⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⣿⣽⣻
⠀⠀⠀⠈⣯⢚⠤⡃⠔⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⡃⣏⠖⡨⠄⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⣿⢾⣽
⠀⠀⠀⠀⢻⣍⠖⣩⠘⡄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣼⣟⡯⠜⡰⠠⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⢻⣟⣾
⠀⠀⠀⠀⠘⣯⢚⠤⡃⠤⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢹⣿⡧⢋⠤⠁⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠐⠸⣿⣽
⠀⠀⠀⠀⢀⢻⡍⡖⢱⡈⠂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢀⢻⣿⡧⢩⢀⠃⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠁⢀⠀⢿⣿
⠀⠀⢈⣄⣠⠸⣏⡼⠡⡌⡑⢈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢌⢺⣿⣇⠃⠆⡘⠠⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⣰⣲⠤⠘⣿
⠀⠐⠀⠀⠀⡀⢿⡜⡱⢂⡑⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢌⢺⣿⡧⢉⠰⢀⠃⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⠀⠀⢀⡀⠄⢹ ]]


local success, u1 = pcall(function()
    return loadstring(game:HttpGet('https://github.com/Footagesus/WindUI/releases/latest/download/main.lua'))()
end)
if not success or not u1 then return end

-- [ СЕРВИСЫ ]
local _Players = game:GetService('Players')
local _RunService = game:GetService('RunService')
local _UserInputService = game:GetService('UserInputService')
local _Workspace = game:GetService('Workspace')
local _LocalPlayer = _Players.LocalPlayer
local _Camera = _Workspace.CurrentCamera

-- [ ПЕРЕМЕННЫЕ ]
local originalMaterials = {}
local autoKillConn, autoSwordConn
local oldNamecall

-- [ ГЛОБАЛЬНЫЕ НАСТРОЙКИ ]
getgenv().SilentAim = {
    Enabled = false,
    FOV = 130,
    ShowFOV = false,
    FOVType = "Mouse", 
    TargetPart = "Head",
    HitChance = 100,
    Target = nil
}

getgenv().Visuals = {
    ItemsFF = false,
    ItemsColor = Color3.new(1,1,1),
    ItemsRainbow = false,
    CharFF = false,
    CharColor = Color3.new(1,1,1),
    CharRainbow = false,
    RainbowSpeed = 0.01
}

getgenv().PlayerMod = {
    SpeedEnabled = false,
    SpeedValue = 16.5,
    JumpEnabled = false,
    JumpValue = 50,
    InfJump = false,
    SpinEnabled = false,
    SpinSpeed = 50
}

getgenv().HitboxMod = {
    Enabled = false,
    Size = 5,
    Shape = "Box", 
    Transparency = 0.5,
    Color = Color3.fromRGB(255, 0, 0)
}

getgenv().ESPConfig = {
    Enabled = false,
    Box3D = false,
    ShowWeapon = false,
    MaxDistance = 200
}

-- [ ФУНКЦИИ ]
local function EquipAllItems()
    for _, t in pairs(_LocalPlayer.Backpack:GetChildren()) do
        if t:IsA("Tool") then
            t.Parent = _LocalPlayer.Character
            task.wait(0.05)
        end
    end
end

local function SaveOriginals(obj)
    if not obj then return end
    for _, part in ipairs(obj:GetDescendants()) do
        if part:IsA("BasePart") and not originalMaterials[part] then
            originalMaterials[part] = { Material = part.Material, Color = part.Color }
        end
    end
end

local function RestoreOriginals(obj)
    if not obj then return end
    for _, part in ipairs(obj:GetDescendants()) do
        if part:IsA("BasePart") and originalMaterials[part] then
            part.Material = originalMaterials[part].Material
            part.Color = originalMaterials[part].Color
        end
    end
end

-- [ SILENT AIM LOGIC ]
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = getgenv().SilentAim.FOV
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.Color = Color3.fromRGB(255, 157, 58)

local function GetClosestTarget()
    local target = nil
    local maxDist = getgenv().SilentAim.FOV
    local screenPoint = getgenv().SilentAim.FOVType == "Mouse" and _UserInputService:GetMouseLocation() or (_Camera.ViewportSize / 2)

    for _, v in pairs(_Players:GetPlayers()) do
        if v ~= _LocalPlayer and v.Character and v.Character:FindFirstChild(getgenv().SilentAim.TargetPart) then
            local hum = v.Character:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then continue end
            local part = v.Character[getgenv().SilentAim.TargetPart]
            local pos, onScreen = _Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local mag = (Vector2.new(pos.X, pos.Y) - screenPoint).Magnitude
                if mag < maxDist then
                    target = part
                    maxDist = mag
                end
            end
        end
    end
    return target
end

oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if not checkcaller() and getgenv().SilentAim.Enabled and getgenv().SilentAim.Target then
        if method == "Raycast" then
            args[2] = (getgenv().SilentAim.Target.Position - args[1]).Unit * 1000
            return oldNamecall(self, unpack(args))
        elseif method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRay" then
            local origin = args[1].Origin
            args[1] = Ray.new(origin, (getgenv().SilentAim.Target.Position - origin).Unit * 1000)
            return oldNamecall(self, unpack(args))
        end
    end
    return oldNamecall(self, ...)
end))

-- [ 3D ESP LOGIC ]
local function create3DBox(pl)
    local ls = {}
    for i=1,12 do 
        local l = Drawing.new("Line"); l.Visible = false; l.Color = Color3.fromRGB(255, 157, 58); l.Thickness = 1.4; ls[i] = l 
    end
    _RunService.RenderStepped:Connect(function()
        local ch = pl.Character
        if not getgenv().ESPConfig.Enabled or not getgenv().ESPConfig.Box3D or not ch or not ch:FindFirstChild("HumanoidRootPart") then
            for _,l in pairs(ls) do l.Visible = false end return
        end
        local root = ch.HumanoidRootPart
        local dist = (_LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) and (root.Position - _LocalPlayer.Character.HumanoidRootPart.Position).Magnitude or 999
        local _, vis = _Camera:WorldToViewportPoint(root.Position)
        if vis and dist <= getgenv().ESPConfig.MaxDistance then
            local s = Vector3.new(2, 3, 1.5) * 1.2
            local cf = root.CFrame
            local pts = {}
            for x=-1,1,2 do for y=-1,1,2 do for z=-1,1,2 do
                local v = _Camera:WorldToViewportPoint((cf * CFrame.new(x*s.X, y*s.Y, z*s.Z)).p)
                table.insert(pts, Vector2.new(v.X, v.Y))
            end end end
            local ed = {{1,2},{2,4},{4,3},{3,1},{5,6},{6,8},{8,7},{7,5},{1,5},{2,6},{3,7},{4,8}}
            for i,e in ipairs(ed) do ls[i].From = pts[e[1]]; ls[i].To = pts[e[2]]; ls[i].Visible = true end
        else for _,l in pairs(ls) do l.Visible = false end end
    end)
end

-- [ UI ]
u1.AddTheme(u1, { Name = 'Solar', Accent = '#ff9d3a', Outline = '#ffd8a1', Text = '#fff5e0', Background = '#1b120c' })
local u16 = u1.CreateWindow(u1, { Title = 'Classic Duels VOMAGLA', Icon = 'sun', Size = UDim2.fromOffset(450, 520) })
u16:EditOpenButton({Title = 'Wicik', Draggable = true})

-- MAIN TAB
local mainTab = u16:Tab({ Title = 'Main', Icon = 'target' })
mainTab:Section({ Title = 'Combat' })
mainTab:Toggle({ Title = 'Silent Aim', Callback = function(v) getgenv().SilentAim.Enabled = v end })
mainTab:Toggle({ Title = 'Auto Kill (Gun)', Callback = function(state)
    if autoKillConn then autoKillConn:Disconnect(); autoKillConn = nil end
    if state then
        autoKillConn = _RunService.Heartbeat:Connect(function()
            if _LocalPlayer.Character then
                local gun = _LocalPlayer.Character:FindFirstChild("Gun") or _LocalPlayer.Backpack:FindFirstChild("Gun")
                if gun then
                    if gun.Parent ~= _LocalPlayer.Character then gun.Parent = _LocalPlayer.Character end
                    for _, enemy in pairs(_Players:GetPlayers()) do
                        if enemy ~= _LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                            if gun:FindFirstChild("Fire") then
                                gun.Fire:FireServer(_LocalPlayer.Character.HumanoidRootPart.Position, enemy.Character.HumanoidRootPart.Position, enemy.Character.HumanoidRootPart, enemy.Character.HumanoidRootPart.CFrame)
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end })
mainTab:Toggle({ Title = 'Auto Sword Kill', Callback = function(state)
    if autoSwordConn then autoSwordConn:Disconnect(); autoSwordConn = nil end
    if state then
        autoSwordConn = _RunService.Heartbeat:Connect(function()
            if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, enemy in pairs(_Players:GetPlayers()) do
                    if enemy ~= _LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (enemy.Character.HumanoidRootPart.Position - _LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if dist <= 150 then
                            local sword = _LocalPlayer.Character:FindFirstChildOfClass("Tool") or _LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                            if sword and sword.Name:find("Sword") then
                                sword.Parent = _LocalPlayer.Character
                                _LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                sword:Activate()
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end })
mainTab:Section({ Title = 'FOV Settings' })
mainTab:Toggle({ Title = 'Show FOV', Callback = function(v) getgenv().SilentAim.ShowFOV = v end })
mainTab:Dropdown({ Title = 'FOV Mode', Values = {"Mouse", "Center"}, Callback = function(v) getgenv().SilentAim.FOVType = v end })
mainTab:Slider({ Title = 'FOV Size', Value = {Min = 10, Max = 600, Default = 130}, Callback = function(v) getgenv().SilentAim.FOV = v end })

-- VISUAL TAB
local visualTab = u16:Tab({ Title = 'Visual', Icon = 'sparkles' })
visualTab:Button({ Title = 'Visual Hub', Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/visual.md"))() end })
visualTab:Slider({ Title = 'Rainbow Speed', Step = 0.001, Value = {Min = 0.001, Max = 0.05, Default = 0.01}, Callback = function(v) getgenv().Visuals.RainbowSpeed = v end })
visualTab:Section({ Title = 'Character FF' })
visualTab:Toggle({ Title = 'Forcefield Char', Callback = function(v) getgenv().Visuals.CharFF = v if v then SaveOriginals(_LocalPlayer.Character) else RestoreOriginals(_LocalPlayer.Character) end end })
visualTab:Toggle({ Title = 'Rainbow Char', Callback = function(v) getgenv().Visuals.CharRainbow = v end })
visualTab:Colorpicker({ Title = 'Char Color', Callback = function(v) getgenv().Visuals.CharColor = v end })
visualTab:Section({ Title = 'Items FF' })
visualTab:Toggle({ Title = 'Forcefield Items', Callback = function(v) getgenv().Visuals.ItemsFF = v if not v then RestoreOriginals(_LocalPlayer.Character) end end })
visualTab:Toggle({ Title = 'Rainbow Items', Callback = function(v) getgenv().Visuals.ItemsRainbow = v end })
visualTab:Colorpicker({ Title = 'Items Color', Callback = function(v) getgenv().Visuals.ItemsColor = v end })

-- PLAYER TAB
local plrTab = u16:Tab({ Title = 'Player', Icon = 'user' })
plrTab:Button({ Title = 'Equip All Items', Callback = EquipAllItems })
plrTab:Toggle({ Title = 'Speed Hack', Callback = function(v) getgenv().PlayerMod.SpeedEnabled = v end })
plrTab:Slider({ Title = 'Speed Value', Value = {Min = 1, Max = 300, Default = 16.5}, Callback = function(v) getgenv().PlayerMod.SpeedValue = v end })
plrTab:Toggle({ Title = 'Jump Hack', Callback = function(v) getgenv().PlayerMod.JumpEnabled = v end })
plrTab:Slider({ Title = 'Jump Power', Value = {Min = 1, Max = 600, Default = 50}, Callback = function(v) getgenv().PlayerMod.JumpValue = v end })
plrTab:Toggle({ Title = 'Infinite Jump', Callback = function(v) getgenv().PlayerMod.InfJump = v end })
plrTab:Section({ Title = 'Spin' })
plrTab:Toggle({ Title = 'Spin Enable', Callback = function(v) getgenv().PlayerMod.SpinEnabled = v end })
plrTab:Slider({ Title = 'Spin Speed', Value = {Min = 0, Max = 100, Default = 50}, Callback = function(v) getgenv().PlayerMod.SpinSpeed = v end })

-- HITBOX TAB
local hbTab = u16:Tab({ Title = 'Hitboxes', Icon = 'target' })
hbTab:Toggle({ Title = 'Enable Hitbox', Callback = function(v) getgenv().HitboxMod.Enabled = v end })
hbTab:Dropdown({ Title = 'Shape', Values = {"Box", "Ball"}, Callback = function(v) getgenv().HitboxMod.Shape = v end })
hbTab:Slider({ Title = 'Size', Value = {Min = 2, Max = 100, Default = 5}, Callback = function(v) getgenv().HitboxMod.Size = v end })
hbTab:Slider({ Title = 'Transparency', Step = 0.1, Value = {Min = 0, Max = 1, Default = 0.5}, Callback = function(v) getgenv().HitboxMod.Transparency = v end })
hbTab:Colorpicker({ Title = 'Color', Default = Color3.fromRGB(255, 0, 0), Callback = function(v) getgenv().HitboxMod.Color = v end })

-- ESP TAB
local espTab = u16:Tab({ Title = 'ESP', Icon = 'eye' })
espTab:Toggle({ Title = 'Enable ESP', Callback = function(v) getgenv().ESPConfig.Enabled = v end })
espTab:Toggle({ Title = '3D Box', Callback = function(v) getgenv().ESPConfig.Box3D = v end })
espTab:Toggle({ Title = 'Show Weapon', Callback = function(v) getgenv().ESPConfig.ShowWeapon = v end })
espTab:Slider({ Title = 'Max Distance', Value = {Min = 10, Max = 500, Default = 200}, Callback = function(v) getgenv().ESPConfig.MaxDistance = v end })

-- ESP WEAPON LOGIC
local function applyWeaponESP(plr)
    local bg = Instance.new("BillboardGui"); bg.Size = UDim2.new(0, 200, 0, 50); bg.AlwaysOnTop = true
    local txt = Instance.new("TextLabel", bg); txt.Size = UDim2.new(1, 0, 1, 0); txt.BackgroundTransparency = 1; txt.TextColor3 = Color3.new(1,1,1); txt.TextSize = 14
    _RunService.Heartbeat:Connect(function()
        if plr.Character and plr.Character:FindFirstChild("Head") and getgenv().ESPConfig.Enabled and getgenv().ESPConfig.ShowWeapon then
            local tool = plr.Character:FindFirstChildOfClass("Tool")
            if tool then
                txt.Text = "[" .. tool.Name .. "]"
                bg.Parent = plr.Character.Head; bg.Adornee = plr.Character.Head; bg.Enabled = true
            else bg.Enabled = false end
        else bg.Enabled = false end
    end)
end
for _, p in pairs(_Players:GetPlayers()) do if p ~= _LocalPlayer then create3DBox(p); applyWeaponESP(p) end end
_Players.PlayerAdded:Connect(function(p) create3DBox(p); applyWeaponESP(p) end)

-- HEARTBEAT LOOP
local hue = 0
_RunService.Heartbeat:Connect(function()
    hue = (hue + getgenv().Visuals.RainbowSpeed) % 1
    local rainbowColor = Color3.fromHSV(hue, 1, 1)
    if getgenv().Visuals.ItemsRainbow then getgenv().Visuals.ItemsColor = rainbowColor end
    if getgenv().Visuals.CharRainbow then getgenv().Visuals.CharColor = rainbowColor end

    getgenv().SilentAim.Target = GetClosestTarget()
    fov_circle.Visible = getgenv().SilentAim.ShowFOV
    fov_circle.Radius = getgenv().SilentAim.FOV
    fov_circle.Position = getgenv().SilentAim.FOVType == "Mouse" and _UserInputService:GetMouseLocation() or (_Camera.ViewportSize / 2)

    local char = _LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = getgenv().PlayerMod.SpeedEnabled and getgenv().PlayerMod.SpeedValue or 16.5
            hum.JumpPower = getgenv().PlayerMod.JumpEnabled and getgenv().PlayerMod.JumpValue or 50
        end
        if getgenv().Visuals.CharFF then
            for _, p in ipairs(char:GetChildren()) do if p:IsA("BasePart") then p.Material = Enum.Material.ForceField; p.Color = getgenv().Visuals.CharColor end end
        end
        if getgenv().Visuals.ItemsFF then
            for _, t in pairs(char:GetChildren()) do
                if t:IsA("Tool") then
                    for _, p in ipairs(t:GetDescendants()) do if p:IsA("BasePart") then p.Material = Enum.Material.ForceField; p.Color = getgenv().Visuals.ItemsColor end end
                end
            end
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp and getgenv().PlayerMod.SpinEnabled then
            local s = hrp:FindFirstChild("WSpin") or Instance.new("BodyAngularVelocity", hrp); s.Name = "WSpin"
            s.MaxTorque = Vector3.new(0, math.huge, 0); s.AngularVelocity = Vector3.new(0, getgenv().PlayerMod.SpinSpeed, 0)
        elseif hrp and hrp:FindFirstChild("WSpin") then hrp.WSpin:Destroy() end
    end

    for _, p in pairs(_Players:GetPlayers()) do
        if p ~= _LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            if getgenv().HitboxMod.Enabled then
                hrp.Size = Vector3.new(getgenv().HitboxMod.Size, getgenv().HitboxMod.Size, getgenv().HitboxMod.Size)
                hrp.Transparency = getgenv().HitboxMod.Transparency; hrp.Color = getgenv().HitboxMod.Color; hrp.Shape = getgenv().HitboxMod.Shape == "Ball" and Enum.PartType.Ball or Enum.PartType.Block; hrp.CanCollide = false
            else
                hrp.Size = Vector3.new(2, 2, 1); hrp.Transparency = 1
            end
        end
    end
end)

_UserInputService.JumpRequest:Connect(function()
    if getgenv().PlayerMod.InfJump and _LocalPlayer.Character then
        local hum = _LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

u16:SelectTab(1)
