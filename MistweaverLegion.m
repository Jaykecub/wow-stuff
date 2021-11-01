%%   Mistweaver Spells
%       Kecub - Sargeras

%       [Spell Name]H --> heal amount
%       simply !total! heal amount spell does

%       [Spell Name]HpS --> heal amount / cast time
%        heal for spell based on cast time... not as accurate for HoTs

%        [Spell Name]HpT --> heal amount / time
%         heal for the time it takes to be fully completed
%        good to compare hots(Hpt) to heals(HpS)

%        [Spell Name]HpM --> heal amount / Mana cost
%        efficiency means
%        how much heal for 1 mana

%         [Spell Name]HpTA --> Healing / Time with cast time

close all; clear; clc;
%%  Stats

SpellPower = 1
SP = SpellPower;
Mana = 100 
GCD = 1.5;  %sec -- GCD

% t(1) = 6; %sec -- baseline for 2 spells
% %EnvelopingMist & EssenceFont
% 
% t(2) = 20; %sec
% %RenewingMist
% 
% t(3) = 10/(0.5); %sec -- heals every .5 seconds
% %Soothing -- Infinite time, but will set to 10 sec to test

%   Mastery
Mastery = 1.00;    %   100%
GustofMists = SpellPower * Mastery;
%   Mastery

%%      Spells


%%      Effuse

EffuseH = 2.50*SpellPower;
%       250% Spell Power

EffuseHpS = (EffuseH / GCD);

EffuseHpM = (EffuseH / (0.02*Mana));
%       2% Mana

EffuseHpMpT = EffuseHpM / GCD;


%       Artifact Increase -- 12% increase
        EffuseArt = (2.5*SpellPower)*1.12;
        
        EffuseArtHpS = (EffuseArt / GCD);
        
        EffuseArtHpM = (EffuseArt / (0.02*Mana));
        %       2% Mana

%%      EnvelopingMist

EnvelopingMistH = 9.90*SpellPower;
%       990% Spell Power

EnvelopingMistHpS= EnvelopingMistH / 6;

EnvelopingMistHpM = (EnvelopingMistH / (0.052*Mana));
%       5.2% Mana
EnvelopingMistHpMpS = EnvelopingMistHpM / 6;


%       Artifact Increase -- 12% increase
        EnvelopingMistArt = (9.90*SpellPower)*1.12;
        
        EnvelopingMistArtHpS = EnvelopingMistArt / 6;
        
        EnvelopingMistArtHpM = (EnvelopingMistArt / (0.052*Mana));
        %       5.2% Mana



%%      EssenceFont

EssenceFontH = (((1.10*SpellPower) + (0.36*SpellPower))*(3))*(6); 
%       1.46% spell power -- 3 ticks -- up to 18 allies
EssenceFontDung = (((1.10*SpellPower) * 5)*3) + ((0.36*SpellPower)*5);
%       5 Targets -- Assuming HoT only gets 5 applications instead of 15

EssenceFontHpS = EssenceFontH / 3;  
%       over 3 second channel
EssenceFontDungHpS = EssenceFontDung / 3;
%       over 3 Second Channel

EssenceFontHpM = (EssenceFontH / (0.072*Mana));      
%       7.2% base mana
EssenceFontHpMpS = EssenceFontHpM / 3;


%      Artifact Increase -- 20% increase
        EssenceFontArt = EssenceFontH * 1.2;

        EssenceFontArtDung = EssenceFontDung * 1.2;
        
        EssenceFontArtHpS = EssenceFontArt / 3;
        EssenceFontArtDungHpS = EssenceFontArtDung / 3;
        
        EssenceFontArtHpM = (EssenceFontArt / (0.072*Mana));
        EssenceFontArtDungHpM = (EssenceFontArtDung / (0.072*Mana));
        %       7.2% Mana



%%      RenewingMist

RenewingMistH = 7.00*SpellPower;         
%       700% Spellpower

RenewingMistHpS = RenewingMistH / 20;
%       over 20 seconds

RenewingMistHpM = (RenewingMistH / (0.03*Mana));   
%   3% base mana
RenewingMistHpMpT = RenewingMistHpM / 20;


%       Artifact Increase -- 4 Extra Seconds
        RenewingMistArt = 7.00*SpellPower + (4*(7.00/20));
        
        RenewingMistArtHpS = RenewingMistArt / 24;
        
        RenewingMistArtHpM = (RenewingMistArt / (0.03*Mana));
        %       3% Base Mana



%%      SoothingMist

SoothingMistH = 0.64*SpellPower;     
%       64% Spellpower

SoothingMistHpS = SoothingMistH / (GCD / 3);

SoothingMistHpM = (SoothingMistH / (0.003*Mana)); 
%based on PvP talent


%       Artifact Increase -- 12% Increase
        SoothingMistArt = SoothingMistH*1.12;
        
        SoothingMistArtHpS = SoothingMistArt / (GCD / 3);
        
        SoothingMistArtHpM = SoothingMistArt / ((0.02*Mana)/8);
        %       Cost of 1 effuse every 8 seconds (renewing mist cooldown)
        


%%      Vivify

VivifyH1 = 2.75*SpellPower;      
%   275% Spellpower (single target)

VivifyH = 2.75*SpellPower*3;
%Heals target & 2 additional allies

VivifyHUT = VivifyH * 1.4;      
%   Uplifting Trance Proc

VivifyHpS = (VivifyH / GCD);

VivifyHpM = (VivifyH / (0.04*Mana));  
%   4%    base mana

VivifyHpMpT = VivifyHpM / GCD;


%       Artifact Increase -- 20% Increase
        VivifyArt = ((2.75*SpellPower)*3)*1.2 + GustofMists;
        VivifyArtH1 = (2.75*SpellPower)*1.2 + GustofMists;
        
        VivifyArtHUT = VivifyArt * 1.4;
        %       Uplifting Trance Proc
        
        VivifyArtHpS = (VivifyArt / GCD);
        
        VivifyArtHpM = VivifyArt / (0.04*Mana);
        %       4% base Mana



%%      Graphs
% %   Heal totals
% figure
% hold on;
% title('Heal  |&|  Heal/Mana  |&|  Heal/Time')
% area1 = subplot(3,1,1)
% area2 = subplot(3,1,2);
% area3 = subplot(3,1,3);
% bar(area1, [EffuseH EnvelopingMistH RenewingMistH EssenceFontH VivifyH;])
% legend('Effuse', 'Enveloping Mist', 'Renewing Mist', 'Essence Font', 'Vivify')
% bar(area2,[EffuseHpM EnvelopingMistHpM RenewingMistHpM EssenceFontHpM VivifyHpM])
% 
% bar(area3,[EffuseHpS EnvelopingMistHoT RenewingMistHoT EssenceFontHoT VivifyHpS])
% %axis off
%hold off;

%%      Baseline Graphs

%   Heal Amount
figure
hold on;
bar([SoothingMistH, RenewingMistH, EnvelopingMistH, EffuseH, VivifyH, EssenceFontH; SP, SP, SP, SP, SP, SP])
legend('Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font')
title('Legion - Heal Amounts')
hold off;
%   Heal Amount


%   Heal / Mana
figure
hold on;
bar([SoothingMistHpM, RenewingMistHpM, EnvelopingMistHpM, EffuseHpM, VivifyHpM, EssenceFontHpM; SP, SP, SP, SP, SP, SP])
legend('Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font')
%axis off
title('Legion - Heal/Mana')
hold off;
%   Heal / Mana

% 
% %   Heal / Sec
% figure
% hold on;
% bar([SoothingMistHpS, RenewingMistHpS, EnvelopingMistHpS, EffuseHpS, VivifyHpS, EssenceFontHpS; SP, SP, SP, SP, SP, SP])
% legend('Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font')
% %axis off
% title('Heal/Sec')
% hold off;
% %   Heal / Sec


%%      Artifact Graphs

%       Using EssenceFont Dungeon Healing because it's more often the case when healing

%   Heal Amount Artifact
figure
hold on;
bar([SoothingMistArt, RenewingMistArt, EnvelopingMistArt, EffuseArt, VivifyArt, EssenceFontArt; SoothingMistH, RenewingMistH, EnvelopingMistH, EffuseH, VivifyH, EssenceFontH])
legend({'Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font'}, 'Location', 'Northwest')
title('Legion - Artifact vs Base Heal Amounts')
grid on;
grid minor
hold off;
%   Heal Amount Artifact


%   Heal / Mana
figure
hold on;
bar([SoothingMistArtHpM, RenewingMistArtHpM, EnvelopingMistArtHpM, EffuseArtHpM, VivifyArtHpM, EssenceFontArtDungHpM; SoothingMistHpM, RenewingMistHpM, EnvelopingMistHpM, EffuseHpM, VivifyHpM, EssenceFontHpM])
legend({'Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font'}, 'Location', 'Northwest')
%axis off
title('Legion - Artifact vs Base Heal/Mana')
grid on;
grid minor
hold off;
%   Heal / Mana


% %   Heal / Sec
% figure
% hold on;
% bar([SoothingMistArtHpS, RenewingMistArtHpS, EnvelopingMistArtHpS, EffuseArtHpS, VivifyArtHpS, EssenceFontArtDungHpS; SP, SP, SP, SP, SP, SP])
% legend('Soothing Mist', 'Renewing Mist', 'Enveloping Mist', 'Effuse', 'Vivify', 'Essence Font')
% %axis off
% title('Artifact Heal/Sec')
% hold off;
% %   Heal / Sec



%%      Plots

%   One Target Heal
figure
hold on;
x = (0:1:30);
y = (0:(GCD/3):30);
stairs(x*GCD,EffuseH*x,'r','LineWidth',2)
plot(x + GCD*(4/3),EnvelopingMistHpS*x,'y','LineWidth',2)
plot(x,RenewingMistHpS*x, 'g', 'LineWidth', 2)
stairs(y+GCD,SoothingMistHpS*y,'m','LineWidth',2)
stairs(x*GCD,VivifyH1*x,'c','LineWidth',2)

axis([0,30,0,60])
title('Legion - One Target Heal')
legend('Effuse','Enveloping Mist', 'Renewing Mist (one target)', 'Soothing Mist','Vivify')
xlabel('Seconds')
ylabel('Healing Amount')
hold off;
%   One Target Heal



%   Multiple Target Heal
figure
hold on;
x = (0:1:30);
y = (0:(GCD/3):30);
stairs(x*GCD,EffuseH*x,'r','LineWidth',2)
%plot(x + 2,EnvelopingMistHoT*x,'y','LineWidth',2)
%Envelop Part
h = 0;
for x = 1:30
    n = (fix((x+2) / 2)) - (fix(x / 6));
    h = h + EnvelopingMistHpS * n;
    Envelop(x) = h;
end;
x = (1:30);
plot((x-1) + GCD*(1+(1/3)),Envelop,'y','LineWidth',2)
%Envelop Part over
%Renew Part
h = 0;
for x = 1:30
    n = (fix((x+8) / 8)) - (fix(x / 20));
    h = h + RenewingMistHpS * n;
    Renew(x) = h;
end;
x = (1:30);
plot(x-1,Renew,'g','LineWidth',2)
%Renew Part over
x = (0:1:30);
stairs(y+GCD,SoothingMistHpS*y,'m','LineWidth',2)
stairs(x*GCD,VivifyH*x,'c','LineWidth',2)
plot(x,EssenceFontHpS*x,'b','LineWidth',2)
plot(x,EssenceFontDungHpS*x, 'k','LineWidth',2)

axis([0,30,0,100])
title('Legion - Max Target Heal')
legend('Effuse','Enveloping Mist', 'Renewing Mist', 'Soothing Mist','Vivify','Essence Font (6 Targets)','Essence Font (5 Targets)')
xlabel('Seconds')
ylabel('Healing Amount')
hold off;
%   Multiple Target Heal



%       Enveloping Mist + Soothing Mist

normalize = 0;
 %      ticks of (GCD / 3) = 0.5
i = 1;
EMSM = zeros(1,61);
while (i < 62)
        if (normalize < (GCD * (4/3)))
                EMSM(i) = 0;
        else
                if ((normalize == (GCD*(4/3))) || (normalize == (7 + (GCD*(4/3)))))
                        EMSM(i) = GustofMists;
                end;
                if (mod(normalize,(GCD/3)) == 0)
                        EMSM(i) = (SoothingMistArt * (1.4)) + EMSM(i-1);
                end;
                if (mod(normalize,(GCD*(4/3))) == 0)
                        EMSM(i) = EnvelopingMistArtHpS + EMSM(i-1);
                end;
                
        end;
        normalize = normalize + (GCD/3);
        i = i + 1;
end;
%       Enveloping Mist + Soothing Mist


%   One Target Heal Artifact


figure
hold on;
x = (0:1:30);
y = (0:(GCD/3):30);
stairs(x*GCD,EffuseArt*x,'r','LineWidth',2)
plot(x + GCD*(4/3),EnvelopingMistArtHpS*x,'y','LineWidth',2)
plot(x,RenewingMistArtHpS*x + GustofMists, 'g', 'LineWidth', 2)
stairs(y+GCD,SoothingMistArtHpS*y,'m','LineWidth',2)
stairs(x*GCD,VivifyArtH1*x,'c','LineWidth',2)
plot(y,EMSM,'b','LineWidth',2)

axis([0,30,0,60])
title('Legion - Single Target Artifact')
legend('Effuse','Enveloping Mist', 'Renewing Mist (one target)', 'Soothing Mist','Vivify', 'Envelop + Soothing')
xlabel('Seconds')
ylabel('Healing Amount')
hold off;
%   One Target Heal






%   Mana Usage Spam

%   Mana Usage Spam end

% figure
% hold on;
% y = (0:100);
% plot(y,EffuseHpM*y,'m','LineWidth',2)
% plot(y,EnvelopingMistHpM*y, 'y', 'LineWidth', 2)
% plot(y,EssenceFontHpM*y, 'b', 'LineWidth', 2)
% plot(y,RenewingMistHpM*y, 'g', 'LineWidth', 2)
% plot(y,SoothingMistHpM*y, 'c', 'LineWidth', 2)
% plot(y,VivifyHpM*y,'r','LineWidth',2)
% 
% axis([0,100,0,2000000])
% title('Healing Spells / Mana')
% legend('Effuse','Enveloping Mist','Essence Font', 'Renewing Mist (one target)', 'Soothing Mist (PvP)','Vivify')
% xlabel('Mana')
% ylabel('Healing Amount')
% hold off;