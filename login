from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QLabel, QLineEdit, QPushButton, QVBoxLayout, QHBoxLayout, QWidget
)
from PyQt6.QtGui import QFont, QPixmap, QPainter, QColor, QBrush, QFontDatabase
from PyQt6.QtCore import Qt, QRect


class ModernLoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Login </> Data_Mind Sistemas")
        self.setGeometry(100, 100, 900, 500)
        self.setStyleSheet("background-color: #2A446B;")  # Fundo azul-escuro
        self.initUI()

    def initUI(self):
        # Carregar a fonte personalizada
        font_id = QFontDatabase.addApplicationFont("Orbitron.ttf")  # Substitua pelo caminho da fonte
        if font_id != -1:
            self.font_family = QFontDatabase.applicationFontFamilies(font_id)[0]
        else:
            self.font_family = "Arial"  # Fonte alternativa caso a personalizada falhe

        # Layout principal
        main_layout = QHBoxLayout()

        # Seção esquerda (texto e imagem)
        left_layout = QVBoxLayout()
        left_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        image_label = QLabel()
        image_label.setPixmap(QPixmap("DATA Mind.png").scaled(200, 200, Qt.AspectRatioMode.KeepAspectRatio))
        image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        description_label = QLabel("Faça login\nE entre para o nosso time")
        description_label.setFont(QFont(self.font_family, 24))
        description_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        description_label.setStyleSheet("color: white; font-weight: bold;")

        left_layout.addWidget(image_label)
        left_layout.addWidget(description_label)

        # Seção direita (formulário de login com efeito de card)
        login_card = QWidget()
        login_card.setFixedSize(400, 300)
        login_card.setStyleSheet("""
            background-color: #1E1E1E;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0, 255, 112, 0.5);  /* Efeito de sombra neon */
        """)

        login_layout = QVBoxLayout()
        login_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        title_label = QLabel("LOGIN")
        title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        title_label.setFont(QFont(self.font_family, 20, QFont.Weight.Bold))
        title_label.setStyleSheet("color: white;")

        username_input = QLineEdit()
        username_input.setPlaceholderText("Usuário")
        username_input.setStyleSheet("""
            background-color: #2C2C2C;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            padding: 10px;
        """)

        password_input = QLineEdit()
        password_input.setPlaceholderText("Senha")
        password_input.setEchoMode(QLineEdit.EchoMode.Password)
        password_input.setStyleSheet("""
            background-color: #2C2C2C;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            padding: 10px;
        """)

        login_button = QPushButton("Entrar")
        login_button.setStyleSheet("""
            background-color: #00FF70;
            color: black;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            padding: 10px;
        """)
        login_button.clicked.connect(self.on_login_click)

        # Adicionando elementos ao layout do formulário
        login_layout.addWidget(title_label)
        login_layout.addSpacing(20)
        login_layout.addWidget(username_input)
        login_layout.addWidget(password_input)
        login_layout.addSpacing(20)
        login_layout.addWidget(login_button)

        # Adicionar layout ao card
        login_card.setLayout(login_layout)

        # Adicionar layouts principais
        main_layout.addLayout(left_layout, 1)
        main_layout.addWidget(login_card, 1)

        # Configurar widget central
        container = QWidget()
        container.setLayout(main_layout)
        self.setCentralWidget(container)

    def on_login_click(self):
        print("Login clicado!")

    def paintEvent(self, event):
        # Adicionar gradiente no fundo
        painter = QPainter(self)
        painter.setRenderHint(QPainter.RenderHint.Antialiasing)

        # Gradiente de fundo
        rect = self.rect()
        gradient = QBrush(QColor(42, 68, 107))
        painter.fillRect(rect, gradient)


if __name__ == "__main__":
    app = QApplication([])

    # Criar janela principal
    window = ModernLoginWindow()
    window.show()

    app.exec()
