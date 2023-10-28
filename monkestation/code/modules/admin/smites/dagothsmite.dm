// Dagoth Smite! (ported from Biblefart code) - Dexee
/datum/smite/dagothsmite
	name = "Dagoth Smite"

datum/smite/dagothsmite/effect(client/user, mob/living/target)
	. = ..()
	if (!iscarbon(target))
		to_chat(user, span_warning("This must be used on a carbon mob."), confidential = TRUE)
		return
	var/mob/living/carbon/human/Person = target
	var/turf/Location = get_turf(target)
	var/turf/T = get_step(get_step(Person, NORTH), NORTH)
	T.Beam(Person, icon_state="lightning[rand(1,12)]", time = 15)
	Person.Paralyze(15)
	playsound(target,'sound/magic/lightningshock.ogg', 50, 1)
	playsound(target, 'monkestation/sound/misc/dagothgod.ogg', 80)
	Person.unequip_everything()
	Person.electrocution_animation(15)
	to_chat(Person,"<span class='ratvar'>What a grand and intoxicating innocence. Perish.</span>")
	spawn(15)
		Person.gib()
		dyn_explosion(Location, 1, 0)
	return
