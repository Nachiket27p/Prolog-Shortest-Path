makes(apple, iphone).
makes(apple, ipad).
makes(apple, macbook).
makes(microsoft, surface).
makes(microsoft, 'zune music player').

isa(apple, 'os-linked manufacturer').
isa(microsoft, 'os-linked manufacturer').
isa(ipad, tablet).
isa(ipad, computer).

isa(macbook, laptop).
isa(macbook, computer).
isa(macbook13, laptop).
isa(macbook13, computer).
isa(macbook15, laptop).
isa(macbook15, computer).

isa(surface, tablet).
isa(surface, laptop).
isa(surface, computer).
isa(surfaceGo, laptop).
isa(surfaceGo, tablet).
isa(surfaceGo, computer).
isa(surfacePro, laptop).
isa(surfacePro, tablet).
isa(surfacePro, computer).

isa(laptop, computer).

has(ipad, touchscreen).
has(iphone, touchscreen).
has(surface, touchscreen).
has(surfaceGo, touchscreen).
has(surfacePro, touchscreen).

compatible(ipad, iphone).
compatible(ipad, macbook).
compatible(ipad, surface).

compatible(iphone, ipad).
compatible(iphone, macbook).
compatible(iphone, surface).

compatible(macbook, iphone).
compatible(macbook, ipad).

compatible(surface, ipad).
compatible(surface, iphone).

size(macbook, 13).
size(macbook, 15).

