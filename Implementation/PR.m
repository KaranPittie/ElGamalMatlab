function[Roots] = PR(k)
%This function finds all Primitive Roots of a number.
%We begin by taking a user input (integer greater than 1) and then
%finding all of its primitive roots
FEE = phi(k);
%We calculate the Phi(input)
if k > 1 && rem(k,1)==0
for m = 1:k    
kk = 1;
while kk <= FEE
    PossiblePrim(1) = m;
    PossiblePrim(kk+1) = mod(m*PossiblePrim(kk),k); 
    kk = kk + 1;
end
%What we are doing in this while loop is taking our current 'm' and raising
%it to every power up to and including the phi(k).
%Round off error becomes an issue, so by using the while loop we can store
%each modulated multiplication into a vector.
%To understand this, try doing the while loop by hand for the number 11
%with m = 3.
for jj = 1:FEE
    if mod(PossiblePrim(jj)-1,k)==0
        TestPrim(jj) = m;
    else
        TestPrim(jj) = 0;
    end
end
%What is happening here is if our PossiblePrim is a primitive root, we need
%to know how many times a modulated multiplication was congruent to 1 (mod
%k).
%If it was only congruent once (only possible on the phi(k)) then TestPrim
%will contain all 0's except for a single m, else, it will have more than
%one m.
    if  sum(TestPrim) == m
        Proot(m) = m;
    else
        Proot(m) = 0;
    end
%If it only contains one m, the sum of TestPrim will be m.
%In other words, only once was it congruent to 1 (mod k) and thus it is a
%primitive root, so we store that m-value inside our answer vector labeled
%Proot.
%If our TestPrim is not a primitive root (contains more than one m), then
%we want to say it is not a primitive root (label it as 0)
end
Roots = Proot(Proot~=0);
%We want to display our Primitive Roots vector (has our answers), but don't
%want the 0's of course.
NumOfRoots = numel(Roots);
Roots = Roots(1);
%disp(Roots);
%if NumOfRoots ~= 0
%disp([num2str(k) ' has ' num2str(NumOfRoots) ' Primitive Roots']);
%else
%disp('No Primitive Roots');
%end
%else
%disp('Please make sure your input is an integer greater than 1');
end
end