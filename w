import arcade
import random

SCREEN_WIDTH = 1500
SCREEN_HEIGHT = 1000

# Selection de couleurs que l'ordinateur peut choisir par hasard (random)
colors = [arcade.csscolor.RED, arcade.csscolor.ORANGE_RED, arcade.csscolor.LIME_GREEN, arcade.csscolor.FOREST_GREEN,
          arcade.csscolor.LIGHT_STEEL_BLUE, arcade.csscolor.MAGENTA, arcade.csscolor.DARK_KHAKI, arcade.csscolor.YELLOW, arcade.csscolor.PURPLE,
          arcade.csscolor.DARK_ORANGE, arcade.csscolor.GREY, arcade.csscolor.AZURE, arcade.csscolor.DARK_CYAN, arcade.csscolor.PALE_VIOLET_RED,
          arcade.csscolor.CADET_BLUE, arcade.csscolor.PALE_TURQUOISE, arcade.csscolor.BLUE, arcade.csscolor.BEIGE, arcade.csscolor.DARK_RED]


# Caractéristiques de la classe cercle
class Cercles:
    def __init__(self, x, y):
        self.rayon = 25
        self.couleur = random.choice(colors)
        self.centre_x = x
        self.centre_y = y
        self.change_x = 30  # Nombre d'unité pour le déplacement sur l'axe des X
        self.change_y = 30  # Nombre d'unité pour le déplacement sur l'axe des Y

    # Déplacements cercle pour éviter que le cercle fuit la fenêtre
    def on_update(self):
        if self.centre_x < 25:
            self.change_x *= -1
        if self.centre_x > 1475:
            self.change_x *= -1
        if self.centre_y < 25:
            self.change_y *= -1
        if self.centre_y > 975:
            self.change_y *= -1

        self.centre_x += self.change_x
        self.centre_y += self.change_y

    def setup(self):
        pass

    # Séquence qui permet de dessiner les cercles
    def on_draw(self):
        arcade.draw_circle_filled(self.centre_x, self.centre_y, self.rayon, self.couleur)



# Caractéristiques de la classe rectangle
class Rectangle:
    def __init__(self, x, y):
        self.width = 50  # Largeur
        self.height = 40  # Longeur
        self.tilt_angle = 90  # Angle du quadrilatère (90 degrés)
        self.centre_x = x
        self.centre_y = y
        self.change_x = 50  # Nombre d'unité pour le déplacement sur l'axe des X
        self.change_y = 50  # Nombre d'unité pour le déplacement sur l'axe des Y
        self.couleur = random.choice(colors)

    # Mouvements pour éviter que le rectangle fuit la fenêtre
    def on_update(self):
        if self.centre_x < 40:
            self.change_x *= -1
        if self.centre_x > 1460:
            self.change_x *= -1
        if self.centre_y < 50:
            self.change_y *= -1
        if self.centre_y > 950:
            self.change_y *= -1

        self.centre_x += self.change_x
        self.centre_y += self.change_y

    def setup(self):
        pass

    # Séquence qui permet de dessiner les rectangles
    def on_draw(self):
        arcade.draw_rectangle_filled(self.centre_x, self.centre_y, self.height, self.width, self.couleur, 90)


class MyGame(arcade.Window):
    def __init__(self):
        super().__init__(SCREEN_WIDTH, SCREEN_HEIGHT, "Clicks")
        self.list_Cercles = []
        self.list_Rectangles = []

    def setup(self):
        pass

    # Fonction qui permet d'apparaitre les formes o`yu la souris le demande (cliquée)
    def on_mouse_press(self, x: int, y: int, button: int, modifiers: int):
        if button == arcade.MOUSE_BUTTON_LEFT:
            self.list_Cercles.append(Cercles(x, y))
        if button == arcade.MOUSE_BUTTON_RIGHT:
            self.list_Rectangles.append(Rectangle(x, y))
#Fonction qui permet de faire apparaitre les formes sans cliquer sur la souris (mouvement de la souris)
    #def on_mouse_motion(self, x: int, y: int, dx: int, dy: int):
        #self.list_Cercles.append(Cercles(x, y))
        #self.list_Cercles.append(Cercles(x, y))
        #self.list_Cercles.append(Cercles(x, y))
        #self.list_Cercles.append(Cercles(x, y))
        #self.list_Rectangles.append(Rectangle(x, y))
        #self.list_Rectangles.append(Rectangle(x, y))
        #self.list_Rectangles.append(Rectangle(x, y))
        #self.list_Rectangles.append(Rectangle(x, y))


    # Fonction qui permet de prendre l'information et le pouvoir la recopier
    def on_update(self, delta_time: float):
        for Cercles in self.list_Cercles:
            Cercles.on_update()
        for Rectangles in self.list_Rectangles:
            Rectangles.on_update()
        #arcade.set_background_color(random.choice(colors))
        #Changer couleur fond d'écran

    # Fonction qui fait apparaître les cercles du on_update
    def on_draw(self):
        arcade.start_render()
        for Cercles in self.list_Cercles:
            Cercles.on_draw()
        for Rectangles in self.list_Rectangles:
            Rectangles.on_draw()


def main():
    my_game = MyGame()
    my_game.setup()

    arcade.run()


main()




