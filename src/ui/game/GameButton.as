package ui.game {

import flash.display.Bitmap;
import flash.display.BitmapData;

import resources.Images;
import resources.Skins;

import ui.base.SimpleButton;
import ui.base.SimpleGroup;
import ui.base.SimpleSizeBox;

public class GameButton extends SimpleButton {

    private var textFiled: GameTextField;
    private var icon: Bitmap;

    private var textIconSizeBox: SimpleSizeBox;
    private var textIconGroup: SimpleGroup;

    public function GameButton() {
        // It is possible to make creation components more beautiful with DSL-simulation
        textFiled = new GameTextField()
                .setGameButtonStyle()
                .setText(" ");

        textIconGroup = new SimpleGroup(/*childPad*/0, /*isVertical*/false);
        textIconGroup.addChild(textFiled);

        textIconSizeBox = new SimpleSizeBox(textIconGroup, /*minContentWidth*/160, /*padLeft*/40, /*padTop*/20, /*padRight*/40, /*padBottom*/20);
        super(textIconSizeBox);

        refresh();
    }

    // ---------------------- Game styles

    public function setGoldStyle():void {
        this.setNormalSkin(Skins.goldNormal)
                .setHoverSkin(Skins.goldHover)
                .setPressSkin(Skins.goldPress)
                .setDisableSkin(Skins.goldDisable, Skins.overDisable);
    }

    public function setGreenStyle():void {
        this.setNormalSkin(Skins.greenNormal)
                .setHoverSkin(Skins.greenHover)
                .setPressSkin(Skins.greenPress)
                .setDisableSkin(Skins.greenDisable, Skins.overDisable);
    }

    public function setSilverStyle():void {
        this.setNormalSkin(Skins.silverNormal)
                .setHoverSkin(Skins.silverHover)
                .setPressSkin(Skins.silverPress)
                .setDisableSkin(Skins.silverDisable, Skins.overDisable);
    }

    // ---------------------- Game Icons

    public function setExperienceIcon():void {
        setIcon(Images.getBitmap(Images.icon_experience_png));
    }

    public function setGoldIcon():void {
        setIcon(Images.getBitmap(Images.icon_gold_png));
    }

    public function setSilverIcon():void {
        setIcon(Images.getBitmap(Images.icon_silver_png));
    }

    // ----------------------

    public function setText(value: String):void {
        textFiled.setText(value);
        refresh();
    }

    public function setIcon(bitmap:Bitmap):void {
        if (icon != null) {
            textIconGroup.removeChild(icon);
        }
        icon = bitmap;
        if (icon != null) {
            textIconGroup.addChild(icon);
        }
        refresh();
    }

    // ---------------------- Inner logic

    override protected function refresh():void {
        // It is possible to make automatic refresh for nested components
        textIconGroup.doLayout();
        textIconSizeBox.doLayout();
        super.refresh();
    }

}
}
