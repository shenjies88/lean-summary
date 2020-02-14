#!/bin/bash
ls `echo \`dirname $0\`` | sed 's/\.sh//g'
