## Triceratops Family

The idea here is that there are several members of a Triceratops family,
at least one parent and several children - Initially we've got 1 adult
and 2 kids.

The dinosaurs talk between themselves by posting their actions on their
MQTT topic, and each member of the family subscribes to everyone else.

Included in the action is an expectation that the issuer has, such as they
might expect the action to be acknowledged, or perhaps repeated, which 
would guide the other dinosaurs in their actions.

### Current Capability

- Currently the children will responsd to their parent, and the actions of the parent are triggered by inject nodes in node-red

### Future Work

- Each Dinosaur should do random actions periodically, which may include some
actions that require responses

- The children may start talking between them, perhaps by both deciding to talk at a similar time triggers this behaviour, or perhaps one of the Dinosaurs responds to a call by the other which might degrade into a squabble
