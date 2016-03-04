function [ ] = decrypt(a, X, encryptImage, p)
%decrypt Summary of this function goes here
%   Detailed explanation goes here
q = X^a;
w = modInv(q,p);
e = w*encryptImage;
display(e);

decryptImage = mod(e,p);
display(decryptImage);
end

