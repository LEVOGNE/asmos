import sys, re, math, os

class Pfad:
    def __init__(self):
        self.konturen=[]
        self.akt=None
        self.x=0.0; self.y=0.0
        self.startx=0.0; self.starty=0.0

    def move(self,x,y):
        self.abschluss()
        self.akt=[('M',x,y)]
        self.x=x; self.y=y; self.startx=x; self.starty=y

    def line(self,x,y):
        if self.akt is None: self.move(x,y); return
        self.akt.append(('L',x,y)); self.x=x; self.y=y

    def quad(self,cx,cy,x,y):
        if self.akt is None: self.move(self.x,self.y)
        self.akt.append(('Q',cx,cy,x,y)); self.x=x; self.y=y

    def cubic(self,c1x,c1y,c2x,c2y,x,y):
        x0,y0=self.x,self.y
        n=2 if self.laenge(x0,y0,c1x,c1y,c2x,c2y,x,y)<8 else 3
        for i in range(n):
            t0=i/n; t1=(i+1)/n
            a=self.cub_punkt(x0,y0,c1x,c1y,c2x,c2y,x,y,t0)
            b=self.cub_punkt(x0,y0,c1x,c1y,c2x,c2y,x,y,t1)
            m=self.cub_punkt(x0,y0,c1x,c1y,c2x,c2y,x,y,(t0+t1)/2)
            cx=2*m[0]-(a[0]+b[0])/2; cy=2*m[1]-(a[1]+b[1])/2
            self.akt.append(('Q',cx,cy,b[0],b[1]))
        self.x=x; self.y=y

    def cub_punkt(self,x0,y0,c1x,c1y,c2x,c2y,x1,y1,t):
        u=1-t
        return (u*u*u*x0+3*u*u*t*c1x+3*u*t*t*c2x+t*t*t*x1,
                u*u*u*y0+3*u*u*t*c1y+3*u*t*t*c2y+t*t*t*y1)

    def arc(self,rx,ry,rot,gross,sweep,x,y):
        x1,y1=self.x,self.y
        if rx==0 or ry==0: self.line(x,y); return
        rot=math.radians(rot)
        dx2=(x1-x)/2.0; dy2=(y1-y)/2.0
        x1p= math.cos(rot)*dx2+math.sin(rot)*dy2
        y1p=-math.sin(rot)*dx2+math.cos(rot)*dy2
        rx=abs(rx); ry=abs(ry)
        lam=(x1p*x1p)/(rx*rx)+(y1p*y1p)/(ry*ry)
        if lam>1: s=math.sqrt(lam); rx*=s; ry*=s
        num=rx*rx*ry*ry-rx*rx*y1p*y1p-ry*ry*x1p*x1p
        den=rx*rx*y1p*y1p+ry*ry*x1p*x1p
        f=math.sqrt(max(0.0,num/den)) if den else 0.0
        if gross==sweep: f=-f
        cxp= f*rx*y1p/ry; cyp=-f*ry*x1p/rx
        cx=math.cos(rot)*cxp-math.sin(rot)*cyp+(x1+x)/2.0
        cy=math.sin(rot)*cxp+math.cos(rot)*cyp+(y1+y)/2.0
        def winkel(ux,uy,vx,vy):
            d=math.sqrt((ux*ux+uy*uy)*(vx*vx+vy*vy))
            if d==0: return 0.0
            c=max(-1.0,min(1.0,(ux*vx+uy*vy)/d))
            a=math.acos(c)
            return -a if ux*vy-uy*vx<0 else a
        t1=winkel(1,0,(x1p-cxp)/rx,(y1p-cyp)/ry)
        dt=winkel((x1p-cxp)/rx,(y1p-cyp)/ry,(-x1p-cxp)/rx,(-y1p-cyp)/ry)
        if not sweep and dt>0: dt-=2*math.pi
        elif sweep and dt<0: dt+=2*math.pi
        n=max(1,int(math.ceil(abs(dt)/(math.pi/2))))
        def bogen(t):
            return (cx+math.cos(rot)*rx*math.cos(t)-math.sin(rot)*ry*math.sin(t),
                    cy+math.sin(rot)*rx*math.cos(t)+math.cos(rot)*ry*math.sin(t))
        for i in range(n):
            ta=t1+dt*i/n; tb=t1+dt*(i+1)/n
            a=bogen(ta); b=bogen(tb); m=bogen((ta+tb)/2)
            qx=2*m[0]-(a[0]+b[0])/2; qy=2*m[1]-(a[1]+b[1])/2
            self.akt.append(('Q',qx,qy,b[0],b[1]))
        self.x=x; self.y=y

    def close(self):
        if self.akt and len(self.akt)>1:
            self.akt.append(('L',self.startx,self.starty))
            self.konturen.append((self.akt,True)); self.akt=None
            self.x=self.startx; self.y=self.starty

    def abschluss(self):
        if self.akt and len(self.akt)>1: self.konturen.append((self.akt,False))
        self.akt=None

    def schritte(self,*p):
        return max(3,min(16,int(self.laenge(*p)*2)))

    def laenge(self,*p):
        s=0.0
        for i in range(0,len(p)-2,2):
            s+=math.hypot(p[i+2]-p[i],p[i+3]-p[i+1])
        return s

class SvgLeser:
    ZAHL=re.compile(r'[-+]?(?:\d*\.\d+|\d+\.?)(?:[eE][-+]?\d+)?')
    def __init__(self,text):
        self.text=text
    def pfade(self):
        return re.findall(r'<path[^>]*\sd="([^"]*)"', self.text)
    def strichbreite(self):
        m=re.search(r'stroke-width="([\d.]+)"', self.text)
        return float(m.group(1)) if m else 2.0
    def viewbox(self):
        m=re.search(r'viewBox="([^"]*)"', self.text)
        if not m: return (0,0,24,24)
        v=[float(x) for x in m.group(1).split()]
        return tuple(v)

class Zerleger:
    def __init__(self,d):
        self.tok=re.findall(r'[MmLlHhVvCcSsQqTtAaZz]|[-+]?(?:\d*\.\d+|\d+\.?)(?:[eE][-+]?\d+)?', d)
        self.i=0
    def zahl(self):
        v=float(self.tok[self.i]); self.i+=1; return v
    def lauf(self,p):
        befehl=None
        letzter_c=None; letzter_q=None
        while self.i<len(self.tok):
            t=self.tok[self.i]
            if re.match(r'^[A-Za-z]$',t): befehl=t; self.i+=1
            elif befehl is None: self.i+=1; continue
            rel=befehl.islower(); b=befehl.upper()
            bx,by=(p.x,p.y) if rel else (0,0)
            if b=='M':
                x=self.zahl()+bx; y=self.zahl()+by; p.move(x,y)
                befehl='l' if rel else 'L'
            elif b=='L':
                p.line(self.zahl()+bx,self.zahl()+by)
            elif b=='H': p.line(self.zahl()+bx,p.y)
            elif b=='V': p.line(p.x,self.zahl()+by)
            elif b=='C':
                c1x=self.zahl()+bx; c1y=self.zahl()+by
                c2x=self.zahl()+bx; c2y=self.zahl()+by
                x=self.zahl()+bx; y=self.zahl()+by
                p.cubic(c1x,c1y,c2x,c2y,x,y); letzter_c=(c2x,c2y)
            elif b=='S':
                c2x=self.zahl()+bx; c2y=self.zahl()+by
                x=self.zahl()+bx; y=self.zahl()+by
                c1x,c1y=(2*p.x-letzter_c[0],2*p.y-letzter_c[1]) if letzter_c else (p.x,p.y)
                p.cubic(c1x,c1y,c2x,c2y,x,y); letzter_c=(c2x,c2y)
            elif b=='Q':
                cx=self.zahl()+bx; cy=self.zahl()+by
                x=self.zahl()+bx; y=self.zahl()+by
                p.quad(cx,cy,x,y); letzter_q=(cx,cy)
            elif b=='T':
                x=self.zahl()+bx; y=self.zahl()+by
                cx,cy=(2*p.x-letzter_q[0],2*p.y-letzter_q[1]) if letzter_q else (p.x,p.y)
                p.quad(cx,cy,x,y); letzter_q=(cx,cy)
            elif b=='A':
                rx=self.zahl(); ry=self.zahl(); rot=self.zahl()
                gross=int(self.zahl()); sweep=int(self.zahl())
                x=self.zahl()+bx; y=self.zahl()+by
                p.arc(rx,ry,rot,gross,sweep,x,y)
            elif b=='Z': p.close()
            else: self.i+=1
        p.abschluss()

ICON_BIAS_UNITS = 4

class Icon:
    def __init__(self,pfad):
        self.name=os.path.basename(pfad).replace('.svg','').replace('-','_')
        text=open(pfad).read()
        leser=SvgLeser(text)
        self.breite=leser.viewbox()[2]
        self.strich=leser.strichbreite()
        self.konturen=[]
        for d in leser.pfade():
            p=Pfad(); Zerleger(d).lauf(p)
            self.konturen+=p.konturen

    def punkte(self):
        return sum(len(k) for k,_ in self.konturen)

    def kurven(self):
        return sum(1 for k,_ in self.konturen for b in k if b[0]=='Q')

    def binaer(self,skala=8):
        def k(v): return max(0,min(255,int(round((v + ICON_BIAS_UNITS) * skala))))
        aus=bytearray()
        aus.append(len(self.konturen))
        aus.append(int(round(self.strich*skala)))
        for befehle,geschlossen in self.konturen:
            aus.append(len(befehle) | (0x80 if geschlossen else 0))
            for b in befehle:
                if b[0]=='M': aus+= bytes([1,k(b[1]),k(b[2])])
                elif b[0]=='L': aus+= bytes([2,k(b[1]),k(b[2])])
                else: aus+= bytes([3,k(b[1]),k(b[2]),k(b[3]),k(b[4])])
        return bytes(aus)

if __name__=='__main__':
    gesamt=0
    for f in sys.argv[1:]:
        ic=Icon(f)
        b=ic.binaer()
        gesamt+=len(b)
        print(f"{ic.name:<18} {len(ic.konturen)} Konturen, {ic.punkte():>3} Befehle ({ic.kurven()} Kurven), {len(b):>4} Byte")
    print(f"{'SUMME':<18} {gesamt} Byte fuer {len(sys.argv)-1} Icons")
