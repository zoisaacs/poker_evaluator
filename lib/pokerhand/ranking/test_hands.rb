
#Sample Pokerhands
RoyalFlush = %w{QC KC JC AC TC} 
Straight5 = %w{2C 3D 4H AC 5S}
FourOfAKind9 = %w{9D 9H 9S 9C 7D} 
FullHouse10Over7 = %w{TD TC TH 7C 7D} 
TwoPair5And9 = %w{5S 5D 9H 9C 6S} 
StraightAce = %w{AS KS JS QS TH}
Ace_10High = %w{AS 2S 3S 4S TC} 
ThreeOfAKind2 = %w{2H 2D 2S 5D 8D}
FlushKing_Queen = %w{2H 4H 6H KH QH}
Pair9 = %w{9C 9S 8D 5H 7S}
FiveHighStraightFlush = %w{AD 5D 4D 2D 3D}

d = Pokerhand.new(StraightAce)
m = Pokerhand.new(FlushKing_Queen)
r = Pokerhand.new(TwoPair5And9)
z = Pokerhand.new(Straight5)
h = Pokerhand.new(FullHouse10Over7)
w = Pokerhand.new(FourOfAKind9)
q = Pokerhand.new(RoyalFlush)
g = Pokerhand.new(Ace_10High)
a = Pokerhand.new(ThreeOfAKind2)
n = Pokerhand.new(Pair9)
u = Pokerhand.new(FiveHighStraightFlush)

#Puts everything into action
poker([a, r, d, n, z, w, h, g, u, q, m])
