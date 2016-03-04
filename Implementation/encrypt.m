function [a, X, encryptImage, p] = encrypt( )
%encrypt Summary of this function goes here
%   Detailed explanation goes here
img = [5 1 2 3;3 1 2 5];
prompt = 'Select a large prime number: ';
p = input(prompt);
display(p);

r = 6;
display(r);

prompt = 'Enter the value of a(Private Key) (Such that a is less than at most equal to p-2): ';
a = input(prompt);
display(a);


s = mod((r^a),p);
display(s);

PublicKey = ['The Public Key will be (',r,s,p,')'];
display(PublicKey);


prompt = 'Enter the value of k such that it is less or atmost equal to p-2: ';
k = input(prompt);


X = mod((r^k),p);
display(X);

intermediate1 = s^k;
intermediate2 = img.*intermediate1;

encryptImage = mod(intermediate2,p);
display(encryptImage);

end