<script lang="ts">
  import * as NavigationMenu from '$lib/components/ui/navigation-menu/index.js';
  import { cn } from '$lib/utils.js';

  let {
    href,
    label,
    active,
    onSelect
  }: { href: string; label: string; active: boolean; onSelect: () => void } = $props();

  const navLinkClass = cn(
    'w-24 justify-center underline decoration-1 underline-offset-2 decoration-transparent',
    'transition-colors duration-300',
    'hover:bg-transparent hover:decoration-(--accent-color) focus:bg-transparent',
    'data-[active]:decoration-(--accent-color) data-[active]:decoration-2'
  );
</script>

<NavigationMenu.Item>
  <NavigationMenu.Link {href} {active} onclick={onSelect} class={navLinkClass}>
    {label}
  </NavigationMenu.Link>
</NavigationMenu.Item>
