fprintf('\t\t\tclassifing into the class pen and marker based on thickness of holder\n');
fprintf("labels\n");
fprintf("w1=pen\t\t w2=marker\n");
pen=[7 5 11 3 6 3 5 6 12 10 3 4 5 6 2]; %pen array
 marker=[11 12 15 5 9 8 17 10 17 19 12 16 7 16 3];%marker array
 
 p_w1=length(pen)/(length(pen)+length(marker));%p(w1) 
 p_w2=length(marker)/(length(pen)+length(marker));%p(w2)
 
 
 prompt = 'Give the evidence value x;\n ';
x = input(prompt);

fprintf("\npriors\n");
fprintf('p(w1)=%f\n',p_w1);
fprintf('p(w2)=%f\n',p_w2);

p1_5 = length(pen( pen(:)>=1 & pen(:)<=5 ));
p6_10 = length(pen( pen(:)>=6 & pen(:)<=10 ));
p11_15 = length(pen( pen(:)>=11 & pen(:)<=15 ));
p16_25= length(pen( pen(:)>=16 & pen(:)<=25 ));

m1_5 = length(marker( marker(:)>=1 & marker(:)<=5 ));
m6_10 = length(marker( marker(:)>=6 & marker(:)<=10 ));
m11_15 = length(marker( marker(:)>=11 & marker(:)<=15 ));
m16_25= length(marker( marker(:)>=16 & marker(:)<=25 ));

rangecount = [p1_5 m1_5;p6_10 m6_10;p11_15 m11_15;p16_25 m16_25];
fprintf("\nintervals frequency\n");
 fprintf(" \tpen\tmarker\n");
disp(rangecount);

if x>=1 && x<=5
    p_x_w1 = p1_5 * p_w1;
    p_x_w2 = m1_5 * p_w2;
elseif x>=6 && x<=10
    p_x_w1 = p6_10 * p_w1;
    p_x_w2 = m6_10 * p_w2;
 elseif x>=11 && x<=15
    p_x_w1 = p11_15 * p_w1;
    p_x_w2 = m11_15 * p_w2;
else
    p_x_w1 = p16_25 * p_w1;
    p_x_w2 = m16_25 * p_w2;
end

fprintf("\nlikelihood\n");
fprintf('p(x|w1)=%f\n',p_x_w1);
fprintf('p(x|w2)=%f\n',p_x_w2);

fprintf("\nevidence\n");
p_x = (p_x_w1 * p_w1)+(p_x_w2 * p_w2);
fprintf('p(x)=%f\n',p_x);

fprintf("\nposterior\n");
p_w1_x = (p_x_w1 * p_w1)/p_x;
p_w2_x = (p_x_w2 * p_w2)/p_x;
fprintf('p(w1|x)=%f\n',p_w1_x);
fprintf('p(w2|x)=%f\n',p_w2_x);

if (p_x_w1/p_x_w2) >= (p_w2/p_w1)
    fprintf('\t\t its a pen\n');
else 
    fprintf('\t\t its a marker\n');
end