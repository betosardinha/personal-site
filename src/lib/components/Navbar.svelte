<script lang="ts">
  import * as NavigationMenu from '$lib/components/ui/navigation-menu/index.js';
  import ThemeToggle from '$lib/components/ThemeToggle.svelte';

  let active = $state('/');
</script>

<NavigationMenu.Root class="relative z-10 flex w-full max-w-full justify-between border-b border-red-500">
  <NavigationMenu.List>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="/" active={active === '/'} onclick={() => (active = '/')} class="font-extrabold hover:bg-transparent focus:bg-transparent !rounded-b-none transition-colors duration-500 data-[active]:!bg-red-500">
        betosardinha.dev
      </NavigationMenu.Link>
    </NavigationMenu.Item>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#projects" active={active === '#projects'} onclick={() => (active = '#projects')} class="hover:bg-transparent focus:bg-transparent !rounded-b-none transition-colors duration-500 data-[active]:!bg-red-500">
        Projects
      </NavigationMenu.Link>
    </NavigationMenu.Item>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#contact" active={active === '#contact'} onclick={() => (active = '#contact')} class="hover:bg-transparent focus:bg-transparent !rounded-b-none transition-colors duration-500 data-[active]:!bg-red-500">
        Contact
      </NavigationMenu.Link>
    </NavigationMenu.Item>
  </NavigationMenu.List>
  <ThemeToggle />
</NavigationMenu.Root>
