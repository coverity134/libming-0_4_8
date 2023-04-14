#!/usr/bin/perl -w

use SWF qw(:ALL);
use SWF::Constants qw(:Text);

die "Usage: ".$0." <sourcedir>\n" unless @ARGV;
$mediadir="$ARGV[0]/../Media";

$m = new SWF::Movie();

$f = new SWF::Font($mediadir."/font01.fdb");

$t = new SWF::Text();
$t->setFont($f);
$t->setColor(0,0,0xff,0xff);
$t->setHeight(20);
$t->moveTo(100, 100);
$t->addString("Static Text");

$tf = new SWF::TextField(SWFTEXTFIELD_NOEDIT);
$tf->setFont($f);
$tf->addString("Readonly Textfield");
$tf->setColor(0xff,0,0,0xff);
$tf->setHeight(20);


$m->add($t);
$it = $m->add($tf);
$it->moveTo(100, 120);

$m->nextFrame();
$m->save("test05.swf");
